package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.domain.service.HelpService;
import com.br.superlogic.songcommunityfactory.domain.service.NotificationService;
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
@RequestMapping("api/notification")
public class NotificationRestController extends SimpleRestController {

    @Autowired
    @Qualifier("notificationService")
    private NotificationService service;
    
    @Autowired
    @Qualifier("helpService")
    private HelpService helpService;

    @PostMapping("/new/from/help/response/id")
    public ResponseEntity<SuccessMessage> createHelpFromReponseId(
            @RequestParam(value = "id") Long id, @RequestParam(value = "message") String _message) 
    {
        HelpResponse helpResponse = helpService.getResponse(id);
        User from = getContextUser();
        User to = helpResponse.getResponder();
        
        String title = "Notificação criada por: <strong>"+from.getUsername()+"</strong> para: <strong>"+to.getUsername()
                +"</strong> em resposta a intenção de ajuda para o projeto: "+helpResponse.getHelp().getProject().getName();
        
        List<User> usersNotify = new ArrayList<>();
        usersNotify.add(from);
        usersNotify.add(to);
        
        List<UserMessageStatus> statuss = new ArrayList<>();
            UserMessageStatus status = new UserMessageStatus();
            status.setStatus(0);
            status.setUser(to);
        statuss.add(status);
        
        List<Message> messages = new ArrayList<>();
            Message message = new Message();
            message.setPhrase(_message);
            message.setFrom(from);
            message.setUserMessageStatus(statuss);
        messages.add(message);
        
        Notification notify = new Notification();
        notify.setTitle(title);
        notify.setLevel(0);
        notify.setProject(helpResponse.getHelp().getProject());
        notify.setCreatedBy(from);
        notify.setUsers(usersNotify);
        notify.setMessages(messages);
        notify.setOpen(Boolean.TRUE);
        
        service.save(notify);
        helpResponse.setNotified(Boolean.TRUE);
        helpService.update(helpResponse);
        
        return new ResponseEntity<>(new SuccessMessage("Notificação enviada com Sucesso!", "id", id), HttpStatus.OK);
    }

    @PostMapping("/new/contract/from/id")
    public ResponseEntity<SuccessMessage> createCrontractFromNotification(@RequestParam(value = "id") Long id) 
    {
        //now I think every object must be created in controller, so I should  have done differently
        service.createContractFromNotification(id, getContextUser());        
        return new ResponseEntity<>(new SuccessMessage("Colaborador incluído com sucesso!", "id", id), HttpStatus.OK);
    }
    
    
    @PostMapping("/new")
    public ResponseEntity<SuccessMessage> _new(@RequestBody Notification notification) 
    {                
        service.save(notification);        
        return new ResponseEntity<>(new SuccessMessage("Notificação incluída com sucesso!"), HttpStatus.OK);
    }

}
