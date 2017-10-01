package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalPublishingDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalWorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ProjectDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ProjectHistoryDao;
import com.br.superlogic.songcommunityfactory.domain.dao.ProjectResourceDao;
import com.br.superlogic.songcommunityfactory.domain.dao.StyleDao;
import com.br.superlogic.songcommunityfactory.domain.dao.SummaryProjectDao;
import com.br.superlogic.songcommunityfactory.domain.dao.TypeDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectHistory;
import com.br.superlogic.songcommunityfactory.domain.model.Style;
import com.br.superlogic.songcommunityfactory.domain.model.util.SummaryProject;
import com.br.superlogic.songcommunityfactory.domain.model.Type;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectService;
import java.io.IOException;
import java.time.LocalDateTime;
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
@Service("projectService")
@Transactional
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    @Qualifier("emailService")
    private EmailServiceImpl emailService;

    @Autowired
    @Qualifier("projectDao")
    private ProjectDao dao;

    @Autowired
    @Qualifier("styleDao")
    private StyleDao styleDao;

    @Autowired
    @Qualifier("typeDao")
    private TypeDao typeDao;

    @Autowired
    @Qualifier("summaryProjectDao")
    private SummaryProjectDao summaryProjectDao;

    @Autowired
    @Qualifier("projectResourceDao")
    private ProjectResourceDao projectResourceDao;

    @Autowired
    @Qualifier("projectHistoryDao")
    private ProjectHistoryDao projectHistoryDao;
    
    @Autowired
    @Qualifier("notificationDao")
    private NotificationDao notificationDao;
    
    @Autowired
    @Qualifier("approvalWorkspaceDao")
    private ApprovalWorkspaceDao approvalWorkspaceDao;
    
    @Autowired
    @Qualifier("approvalPublishingDao")
    private ApprovalPublishingDao approvalPublishings;

    @Override
    public List<Type> listTypes() {
        return typeDao.list();
    }

    @Override
    public List<Style> listStyles() {
        return styleDao.list();
    }

    @Override
    public void update(Project project) {
        //save project and all its data
        dao.save(project);
        //creates object history
        saveHistory(project, 2);
    }

    @Override
    public void insert(Project project) throws IOException {        
        //save project and all its data
        dao.save(project);
        //creates object history
        saveHistory(project, 1);
        
        //move upload data
        projectResourceDao.moveUserTempToProject(project.getResources());

        //send email data 
        project.getEmails().forEach((mail) -> {
            emailService.sendEmail(mail);
        });

        //send email data from notifications
        project.getNotifications().forEach((notification) -> {
            notification.getEmails().forEach((mail) -> {
                emailService.sendEmail(mail);
            });
        });

    }

    private void saveHistory(Project project, Integer type) {
        ProjectHistory history = new ProjectHistory();
        history.setProject(project);
        history.setType(type);
        history.setCreated(LocalDateTime.now());
        projectHistoryDao.save(history);
    }

    @Override
    public List<Project> listProjects(User user) {
        return dao.list(user);
    }

    @Override
    public Project getProject(User user, Long projId) {
        Project project = dao.get(user, projId);
        //need change someday about call every workspace
        Hibernate.initialize(project.getWorkspaces());
        Hibernate.initialize(project.getContracts());
        Hibernate.initialize(project.getHistory());
        Hibernate.initialize(project.getStyles());
        Hibernate.initialize(project.getTypes());
        Hibernate.initialize(project.getHelps());
        Hibernate.initialize(project.getOwner().getFriends());
        
        project.getWorkspaces().forEach((workspace) -> {
            Hibernate.initialize(workspace.getResources());
            Hibernate.initialize(workspace.getBase());
        });

        project.getContracts().forEach((contract) -> {
            Hibernate.initialize(contract.getWorker());
        });

        List<Notification> notifications = notificationDao.listFrom(project, user);
        project.setNotifications(notifications);
        project.getNotifications().forEach((notification) -> {
            Hibernate.initialize(notification.getMessages());
        });
        
        project.setApprovalWorkspaces(approvalWorkspaceDao.listOpen(project));
        project.setApprovalPublishings(approvalPublishings.listOpen(project));

        for (ApprovalWorkspace approval : project.getApprovalWorkspaces())
        {
            Hibernate.initialize(approval.getWorkspace());
            Hibernate.initialize(approval.getWorkspace().getOwner());
        }
        
        for (ApprovalPublishing approval: project.getApprovalPublishings())
        {
            Hibernate.initialize(approval.getRequester());
        }
        
        return project;
    }

    @Override
    public List<SummaryProject> listSummaryProjects(User user) {
        return summaryProjectDao.list(user);
    }

}
