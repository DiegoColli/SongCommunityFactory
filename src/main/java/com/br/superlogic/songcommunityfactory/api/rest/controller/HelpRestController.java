package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Email;
import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.domain.service.HelpService;
import com.br.superlogic.songcommunityfactory.domain.service.NotificationService;
import com.br.superlogic.songcommunityfactory.domain.service.impl.EmailServiceImpl;
import com.br.superlogic.songcommunityfactory.message.EmailBuilder;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/help")
public class HelpRestController extends SimpleRestController {

    @Autowired
    @Qualifier("helpService")
    private HelpService service;
    
    @Autowired
    @Qualifier("notificationService")
    private NotificationService notificationService;

    @Autowired
    EmailBuilder emailBuilder;
    
    @Autowired
    @Qualifier("emailService")
    private EmailServiceImpl emailService;
   
    @PostMapping("/helpOut")
    public ResponseEntity<SuccessMessage> create(@RequestBody HelpResponse helpResp) {
        helpResp.setResponder(super.getContextUser());
        helpResp.setStatus(0);
        service.saveResponse(helpResp);
        return new ResponseEntity<>(new SuccessMessage("Solicitação enviada com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/delete")
    public ResponseEntity<SuccessMessage> delete(@RequestBody Help help) {
        service.delete(help);
        return new ResponseEntity<>(new SuccessMessage("Solicitação excluída com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<SuccessMessage> update(@RequestBody Help help) {
        help.setRequester(super.getContextUser());
        service.save(help);
        return new ResponseEntity<>(new SuccessMessage("Solicitação alterada com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/accept")
    public ResponseEntity<SuccessMessage> accept(@RequestParam(value = "id") Long id) {
        service.accept(super.getContextUser(), id);
        return new ResponseEntity<>(new SuccessMessage("Solicitação aceita com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/refuse")
    public ResponseEntity<SuccessMessage> refuse(@RequestParam(value = "id") Long id) {
        service.refuse(super.getContextUser(), id);
        return new ResponseEntity<>(new SuccessMessage("Solicitação recusada com Sucesso!"), HttpStatus.OK);
    }
    
    
    @PostMapping("/read")
    public ResponseEntity<SuccessMessage> read(@RequestParam(value = "id") Long id) {
        service.setRead(super.getContextUser(), id);
        return new ResponseEntity<>(new SuccessMessage("Solicitação lida com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/publishing")
    public ResponseEntity<SuccessMessage> publishing(@RequestBody Help help) {
        help.setRequester(super.getContextUser());
        service.save(help);
        return new ResponseEntity<>(new SuccessMessage("Solicitação de Ajuda (Comunidade) Salva com Sucesso!"), HttpStatus.OK);
    }
    
    @PostMapping("/others")    
    public ResponseEntity<SuccessMessage> others(@RequestBody List<Email> emails) throws Exception 
    {
        setEmailsInviteData(emails);
        emailService.sendEail(emails);
        return new ResponseEntity<>(new SuccessMessage("Solicitação de Ajuda (Outros) Salva com Sucesso!"), HttpStatus.OK);
    }
    
    @PostMapping("/friends")  
    public ResponseEntity<SuccessMessage> friends(@RequestBody List<Notification> notifications) throws Exception 
    {
        setNewNotificationsData(notifications);
        notifications.forEach((notification) ->
        {
            emailService.sendEail(notification.getEmails());            
        });
        notifications.forEach((notification) ->
        {
            notificationService.save(notification);
        });        
        return new ResponseEntity<>(new SuccessMessage("Solicitação de Ajuda (Amigos) Salva com Sucesso!"), HttpStatus.OK);
    }
    
    
    private void setEmailsInviteData(List<Email> emails) {
        User user = super.getContextUser();
        emails.forEach((email) -> {
            email.setUser(user);
            email.setFrom(user.getEmail());
            email.setStatus(0);
            email.setSubject("Seu amigo(a) " + user.getUsername() + " lhe convidou para fazer parte do SongCommunityFactory");
            email.setBody(emailBuilder.getInviteTemplate(email));
        });
    }
    
    
    private void setNewNotificationsData(List<Notification> notifications) {
        
        User user = super.getContextUser();
        notifications.forEach((notification) -> {

            Message message = notification.getMessages().get(0);
            UserMessageStatus userMsgStatus = message.getUserMessageStatus().get(0);

            String title =  "Notificação Criada por: <strong>" + user.getUsername()
                + "</strong> para: <strong>" + userMsgStatus.getUser().getUsername() + "</strong>, "
                + "a respeito do projeto: " + notification.getProject().getName();

            notification.setCreatedBy(user);
            notification.getUsers().add(user);
            notification.setTitle(title);

            message.setFrom(user);

            List<Email> emails = new ArrayList();             
            Email email = new Email();
            email.setTo(userMsgStatus.getUser().getEmail());                       
            email.setProject(notification.getProject());
            email.setFrom(user.getEmail());
            email.setStatus(0);
            email.setUser(user);
            email.setUserMessage(message.getPhrase());
            email.setSubject("O usuário: " + user.getUsername() + " solicitou sua ajuda para o projeto: " + notification.getProject().getName());
            email.setBody(emailBuilder.getAlertTemplate(email));            
            emails.add(email);

            notification.setEmails(emails);

        });

    }
    
    
    
}
