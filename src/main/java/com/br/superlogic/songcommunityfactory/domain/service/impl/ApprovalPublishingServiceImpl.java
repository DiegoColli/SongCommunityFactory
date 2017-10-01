package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalPublishingDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalPublishingVoteDao;
import com.br.superlogic.songcommunityfactory.domain.dao.CoverDao;
import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ProjectDao;
import com.br.superlogic.songcommunityfactory.domain.dao.PublishingDao;
import com.br.superlogic.songcommunityfactory.domain.dao.SystemMessageDao;
import com.br.superlogic.songcommunityfactory.domain.dao.hibernate.PublicResourceDaoImp;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishingVote;
import com.br.superlogic.songcommunityfactory.domain.model.Contract;
import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.model.PublishingItem;
import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalPublishingService;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author Diego
 */
@Service("approvalPublishingService")
@Transactional
public class ApprovalPublishingServiceImpl implements ApprovalPublishingService{

    @Autowired
    @Qualifier("approvalPublishingDao")
    private ApprovalPublishingDao dao;
    
    @Autowired
    @Qualifier("publishingDao")
    private PublishingDao publishingDao;
    
    @Autowired
    @Qualifier("approvalPublishingVoteDao")
    private ApprovalPublishingVoteDao voteDao;
    
    @Autowired
    @Qualifier("publicResourceDao")
    private PublicResourceDaoImp publicResourceDao;
    
    @Autowired
    @Qualifier("projectDao")
    private ProjectDao projectDao;
    
    @Autowired
    @Qualifier("notificationDao")
    private NotificationDao notificationDao;
    
    @Autowired
    @Qualifier("systemMessageDao")
    private SystemMessageDao systemMessageDao;

    @Autowired
    @Qualifier("coverDao")
    private CoverDao coverDao;
    
    @Override
    public void submitPublishing(ApprovalPublishing approval) throws IOException
    {
        Notification    notify    = new Notification();
        Message         message   = new Message();
        Project         project   = projectDao.get(approval.getProject().getId());
        List<Contract>  contracts = project.getContracts();
        User            user      = approval.getRequester();
        
        //if is just 1 or two people in project, so its aproved
        if(contracts == null || contracts.isEmpty() || contracts.size() == 1)
        {
            aprove(approval);
            //move upload data
            if(approval.getPublishing().getCover()!=null)
                coverDao.moveUserTempToPublic(approval.getPublishing().getCover(), user);
            return;
        }        
        //initialize approve
        approval.setCreated(LocalDateTime.now());
        approval.setDeadLine(LocalDateTime.now().plusDays(3));
        approval.setClose(Boolean.FALSE);
        approval.setVotes(new ArrayList<>());        
        //initialize publishing
        approval.getPublishing().setCreated(LocalDateTime.now());
        approval.getPublishing().setApproved(Boolean.FALSE);
        approval.getPublishing().setProject(project);        
        //initialize notify                
        notify.setTitle("O usuário: <strong>"+user.getUsername()+"</strong> "
            + "realizou um pedido de publicação no projeto: <strong>"+project.getName()+"</strong> ");
        notify.setLevel(4);
        notify.setOpen(Boolean.TRUE);
        notify.setProjLink(Boolean.TRUE);
        notify.setProject(project);
        notify.setCreatedBy(user);
        notify.setMessages(new ArrayList<>());
        notify.setUsers(new ArrayList<>());        
        //initialize Message
        message.setPhrase(approval.getDescription());
        message.setFrom(user);
        message.setNotification(notify);
        message.setUserMessageStatus(new ArrayList<>());        
        //get users from project to create votes, notify users and message
        for (Contract contract : contracts)
        {
            //create vote
            ApprovalPublishingVote vote = new ApprovalPublishingVote();
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
        //last ones
        ApprovalPublishingVote vote = new ApprovalPublishingVote();
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
        for (ApprovalPublishingVote foo : approval.getVotes())
        {
            if(foo.getUser().equals(user))
                foo.setStatus(1);
        }        
        //saves
        notificationDao.save(notify);
        publishingDao.save(approval.getPublishing());        
        dao.save(approval);        
        //move upload data
        if(approval.getPublishing().getCover()!=null)
        {
            coverDao.moveUserTempToPublic(approval.getPublishing().getCover(), user);        
            coverDao.save(approval.getPublishing().getCover());
        }
    }

    @Override
    public void vote(ApprovalPublishingVote vote) throws IOException
    {
        voteDao.save(vote);
        updateApproval(vote);
    }
    
    
    private void updateApproval(ApprovalPublishingVote vote) throws IOException
    {
        ApprovalPublishing approval = dao.get(vote.getApproval().getId());        
        if(approval.isDisapproved())
        {
            approval.getPublishing().setApproved(Boolean.FALSE);
            finishApproveDisapprove(approval, approval.getPublishing(), getSystemMessage(approval));
        }
        else if(approval.isApproved())
        {
            approval.getPublishing().setApproved(Boolean.TRUE);            
            for (PublishingItem item : approval.getPublishing().getItems())
            {
                publicResourceDao.publish(item);   
            }
            
            finishApproveDisapprove(approval, approval.getPublishing(), getSystemMessage(approval));
        }
            
    }

    private void finishApproveDisapprove(ApprovalPublishing approval, Publishing publishing, SystemMessage message)
    {
        approval.setClose(Boolean.TRUE);        
        dao.save(approval);
        publishingDao.save(publishing);
        systemMessageDao.save(message);
    }

    private SystemMessage getSystemMessage(ApprovalPublishing approval)
    {
        SystemMessage message = new SystemMessage();
        String title;
         if(approval.isApproved())
         {
             message.setLevel(1);
             title = "Você teve seu pedido de aprovação de publicação no projeto: "
                + "<strong>"+approval.getProject().getName()+"</strong> aceito!";
         }
         else
         {
             message.setLevel(4);
             title = "Você teve seu pedido de aprovação de publicação no projeto: "
                + "<strong>"+approval.getProject().getName()+"</strong> negado!";
         }                
         message.setTo(approval.getRequester());
         message.setReaded(Boolean.FALSE);                  
         message.setMessage(title);         
         return message;
    }

        
    private void aprove(ApprovalPublishing approval) throws IOException
    {
        approval.getPublishing().setApproved(Boolean.TRUE);
        finishApproveDisapprove(approval, approval.getPublishing(), getSystemMessage(approval));        
        for (PublishingItem item : approval.getPublishing().getItems())
        {
            publicResourceDao.publish(item);   
        }        
        publishingDao.save(approval.getPublishing());
    }
    
    
    @Override
    public ApprovalPublishing getComplete(Long id)
    {
        ApprovalPublishing approval = dao.get(id);
        
        Hibernate.initialize(approval.getProject());
        Hibernate.initialize(approval.getPublishing().getCover());
        Hibernate.initialize(approval.getPublishing().getStyle());        
        for (PublishingItem foo : approval.getPublishing().getItems())
        {
            Hibernate.initialize(foo.getProjectResource());
            Hibernate.initialize(foo.getPublicResource());
        }        
        for (ApprovalPublishingVote foo : approval.getVotes())
        {
            Hibernate.initialize(foo.getUser());
        }        
        return approval;
    }

    
    @Override
    public void update(User user) throws IOException
    {
        List<ApprovalPublishing> approvals = dao.listOpen(user);
        if(approvals != null)
        {
            for (ApprovalPublishing approval : approvals)
            {
                aprove(approval);
            }
        }
    }

}
