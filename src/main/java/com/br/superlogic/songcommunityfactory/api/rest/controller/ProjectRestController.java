package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Email;
import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectService;
import com.br.superlogic.songcommunityfactory.message.EmailBuilder;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/project")
public class ProjectRestController extends SimpleRestController {

    @Autowired
    EmailBuilder emailBuilder;

    @Autowired
    @Qualifier("projectService")
    private ProjectService service;

    @PostMapping("/create")
    public ResponseEntity<SuccessMessage> create(@RequestBody Project project) throws IOException {
        project.setOwner(this.getContextUser());
        setHelpOwner(project, project.getOwner());
        setWorkspaceOwner(project, project.getOwner());
        setResourcesUser(project, project.getOwner());
        setResourcesWorkspace(project, project.getWorkspaces().get(0));
        setEmailsInviteData(project, project.getOwner());
        setNewNotificationsData(project, project.getOwner());

        service.insert(project);

        return new ResponseEntity<>(new SuccessMessage("Projeto Criado com Sucesso!"), HttpStatus.OK);
    }
    
    @PostMapping("/update")
    public ResponseEntity<SuccessMessage> update(@RequestBody Project project) throws IOException {
        service.update(project);
        return new ResponseEntity<>(new SuccessMessage("Projeto Alterado com Sucesso!"), HttpStatus.OK);
    }
    

//--------------- PRIVATE METHODS-----------------------------------------------
    private void setHelpOwner(Project project, User user) {
        if (project.getHelps() != null) {
            project.getHelps().forEach((help) -> {
                help.setRequester(user);
            });
        }
    }

    private void setWorkspaceOwner(Project project, User owner) {
        if (project.getWorkspaces() != null) {
            project.getWorkspaces().forEach((work) -> {
                work.setOwner(owner);
            });
        }
    }

    private void setResourcesUser(Project project, User user) {
        if (project.getResources() != null) {
            project.getResources().forEach((resource) -> {
                resource.setUser(user);
            });
        }
    }

    private void setResourcesWorkspace(Project project, Workspace workspace) {
        if (project.getResources() != null) {
            project.getResources().forEach((resource) -> {
                resource.setWorkspace(workspace);
            });
        }
    }

    private void setEmailsInviteData(Project project, User user) {
        if (project.getEmails() != null) {
            project.getEmails().forEach((email) -> {
                email.setProject(project);
                email.setFrom(user.getEmail());
                email.setStatus(0);
                email.setSubject("Seu amigo(a) " + user.getUsername() + " lhe convidou para fazer parte do SongCommunityFactory");
                email.setBody(emailBuilder.getInviteTemplate(email));
            });
        }
    }

    //at the start every notification has just one conversation, so its ok let the things like this for now.
    private void setNewNotificationsData(Project project, User user) {
        if (project.getNotifications() != null) {
            project.getNotifications().forEach((notification) -> {

                Message message = notification.getMessages().get(0);
                UserMessageStatus userMsgStatus = message.getUserMessageStatus().get(0);

                String title =  "Notificação Criada por: <strong>" + user.getUsername()
                    + "</strong> para: <strong>" + userMsgStatus.getUser().getUsername() + "</strong>, "
                    + "a respeito do novo projeto: " + project.getName();
                
                notification.setCreatedBy(user);
                notification.getUsers().add(user);
                notification.setTitle(title);
                
                message.setFrom(user);

                List<Email> emails = new ArrayList();             
                Email email = new Email();
                email.setTo(userMsgStatus.getUser().getEmail());                       
                email.setProject(project);
                email.setFrom(user.getEmail());
                email.setStatus(0);
                email.setSubject("O usuário: " + user.getUsername() + " solicitou sua ajuda para o projeto: " + project.getName());
                email.setBody(emailBuilder.getAlertTemplate(email));
                emails.add(email);

                notification.setEmails(emails);

            });
        }
    }

}
