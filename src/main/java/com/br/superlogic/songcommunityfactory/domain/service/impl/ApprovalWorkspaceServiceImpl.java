package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalWorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalWorkspaceVoteDao;
import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import com.br.superlogic.songcommunityfactory.domain.dao.SystemMessageDao;
import com.br.superlogic.songcommunityfactory.domain.dao.WorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspaceVote;
import com.br.superlogic.songcommunityfactory.domain.model.Contract;
import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalWorkspaceService;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("approvalWorkspaceService")
@Transactional
public class ApprovalWorkspaceServiceImpl implements ApprovalWorkspaceService{

    @Autowired
    @Qualifier("approvalWorkspaceDao")
    private ApprovalWorkspaceDao dao;
    
    @Autowired
    @Qualifier("approvalWorkspaceVoteDao")
    private ApprovalWorkspaceVoteDao voteDao;
    
    @Autowired
    @Qualifier("workspaceDao")
    private WorkspaceDao workspaceDao;
    
    @Autowired
    @Qualifier("notificationDao")
    private NotificationDao notificationDao;
    
    @Autowired
    @Qualifier("systemMessageDao")
    private SystemMessageDao systemMessageDao;

    @Override
    public void submitWorkspace(Workspace _workspace, String description)
    {
        ApprovalWorkspace   approval    = new ApprovalWorkspace();
        Notification        notify      = new Notification();      
        Message             message     = new Message();
        //I dont know if its necessary
        Workspace           workspace   = workspaceDao.get(_workspace.getId());
        Project             project     = workspace.getProject();
        List<Contract>      contracts   = project.getContracts();
        User                user       = workspace.getOwner();
        
        //if is just 1 or two people in project, so its aproved
        if(contracts == null || contracts.isEmpty() || contracts.size() == 1)
        {
            approve(workspace);
            return;
        }
        
        //initialize notify                
        notify.setTitle("O usuário: <strong>"+workspace.getOwner().getUsername()+"</strong> "
            + "realizou um pedido de aprovação para um espaço de trabalho no projeto: <strong>"+project.getName()+"</strong> ");
        notify.setLevel(3);
        notify.setOpen(Boolean.TRUE);
        notify.setProjLink(Boolean.TRUE);
        notify.setProject(project);
        notify.setCreatedBy(user);
        notify.setMessages(new ArrayList<>());
        notify.setUsers(new ArrayList<>());
        
        //initialize Message
        message.setPhrase(description);
        message.setFrom(user);
        message.setNotification(notify);
        message.setUserMessageStatus(new ArrayList<>());
        
        //initialize Approve
        approval.setDescription(description);
        approval.setCreated(LocalDateTime.now());
        approval.setDeadLine(LocalDateTime.now().plusDays(3));
        approval.setClose(Boolean.FALSE);
        approval.setWorkspace(workspace);
        approval.setProject(workspace.getProject());        
        approval.setVotes(new ArrayList<>());
        
        //get users from project to create votes, notify users and message
        for (Contract contract : contracts)
        {
            //create vote
            ApprovalWorkspaceVote vote = new ApprovalWorkspaceVote();
            vote.setApproval(approval);
            vote.setStatus(0);
            vote.setUser(contract.getWorker());
            //add
            approval.getVotes().add(vote);
            notify.getUsers().add(contract.getWorker());
            
            //create MessageStatus
            if(!contract.getWorker().equals(user))
            {
                UserMessageStatus messageStatus = new UserMessageStatus();
                messageStatus.setStatus(0);
                messageStatus.setMessage(message);
                messageStatus.setUser(contract.getWorker());
                //add
                message.getUserMessageStatus().add(messageStatus);
            }
            
        }        
        
        ApprovalWorkspaceVote vote = new ApprovalWorkspaceVote();
        vote.setApproval(approval);
        vote.setStatus(0);
        vote.setUser(project.getOwner());
        //add
        approval.getVotes().add(vote);
        notify.getUsers().add(project.getOwner());
        
        //create MessageStatus
        if(!project.getOwner().equals(user))
        {
            UserMessageStatus messageStatus = new UserMessageStatus();
            messageStatus.setStatus(0);
            messageStatus.setMessage(message);
            messageStatus.setUser(project.getOwner());
            //add
            message.getUserMessageStatus().add(messageStatus);
        }
        
        //add message
        notify.getMessages().add(message);
        
        //approve for yourself
        for (ApprovalWorkspaceVote foo : approval.getVotes())
        {
            if(foo.getUser().equals(workspace.getOwner()))
                foo.setStatus(1);
        }
        
        //block workspace
        workspace.setBlocked(Boolean.TRUE);
        
        //saves
        workspaceDao.save(workspace);
        notificationDao.save(notify);
        dao.save(approval);
    }
    
    @Override
    public void vote(ApprovalWorkspaceVote vote)
    {
        voteDao.save(vote);
        updateApproval(vote);
    }
    
    
    private void updateApproval(ApprovalWorkspaceVote vote)
    {
        ApprovalWorkspace approval = dao.get(vote.getApproval().getId());
        
        if(approval.isDisapproved())
            disapprove(approval);        
        else if(approval.isApproved())
            approve(approval);        
    }
    
    private void setWorkspaceApproved(Workspace workspace)
    {
        Workspace newest = workspaceDao.getNewestPrincipal(workspace.getProject());
        Double version = newest.getVersion()+1.0;
        workspace.setVersion(version);
        workspace.setBlocked(Boolean.FALSE);
        workspace.setPrincipal(Boolean.TRUE);
    }
    
    private void approve(Workspace workspace)
    {
        setWorkspaceApproved(workspace);
        workspaceDao.save(workspace);        
        SystemMessage message = getSystemMessage(workspace);
        systemMessageDao.save(message);
    }
    
    private void approve(ApprovalWorkspace approval)
    {
        approval.setClose(Boolean.TRUE);
        Workspace workspace = approval.getWorkspace();
        setWorkspaceApproved(workspace);
        finishApproveDisapprove(approval, workspace, getSystemMessage(workspace));
    }
       
    private void disapprove(ApprovalWorkspace approval)
    {
        approval.setClose(Boolean.TRUE);
        Workspace workspace = approval.getWorkspace();
        workspace.setBlocked(Boolean.FALSE);
        finishApproveDisapprove(approval, workspace, getSystemMessage(workspace));
    }
    
    private void finishApproveDisapprove(ApprovalWorkspace approval, Workspace workspace, SystemMessage message)
    {
        dao.save(approval);
        workspaceDao.save(workspace);
        systemMessageDao.save(message);
    }

    private SystemMessage getSystemMessage(Workspace workspace)
    {
        SystemMessage message = new SystemMessage();
        String title;
         if(workspace.getPrincipal())
         {
             message.setLevel(1);
             title = "Você teve seu pedido de aprovação para um espaço de trabalho no projeto: "
                + "<strong>"+workspace.getProject().getName()+"</strong> aceito!";
         }
         else
         {
             message.setLevel(4);
             title = "Você teve seu pedido de aprovação para um espaço de trabalho no projeto: "
                + "<strong>"+workspace.getProject().getName()+"</strong> negado!";
         }       
         
         message.setTo(workspace.getOwner());
         message.setReaded(Boolean.FALSE);                  
         message.setMessage(title);
         
         return message;
    }

    @Override
    public void update(User user)
    {
        List<ApprovalWorkspace> approvals = dao.listOpen(user);
        if(approvals != null)
        {
            for (ApprovalWorkspace approval : approvals)
            {
                approve(approval);
            }
        }
    }
    

}
