package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.UserMessageStatus;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.br.superlogic.songcommunityfactory.domain.service.MessageService;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/conversation")
public class ConversationRestController extends SimpleRestController {

    @Autowired
    @Qualifier("messageService")
    private MessageService service;

    @PostMapping("/finish")
    public ResponseEntity<SuccessMessage> finish(@RequestParam(value = "id") Long id) 
    {
        Message message = service.get(id);
        User user = getContextUser();
        boolean open = false;
        for (UserMessageStatus status : message.getUserMessageStatus()) {
            if (user.equals(status.getUser()) || user.equals(message.getFrom())) {
                status.setStatus(1);
            }
            if (status.getStatus() == 0) {
                open = true;
            }
        }
        message.getNotification().setOpen(open);
        service.save(message);
        return new ResponseEntity<>(new SuccessMessage("Conversa terminada com Sucesso!", "id", id), HttpStatus.OK);
    }

    @PostMapping("/reopen")
    public ResponseEntity<SuccessMessage> reopen(@RequestParam(value = "id") Long id) 
    {
        Message message = service.get(id);
        User user = getContextUser();
        message.getUserMessageStatus().forEach((status) -> {
            if (user.equals(status.getUser()) || user.equals(message.getFrom())) {
                status.setStatus(0);
            }
        });
        message.getNotification().setOpen(true);
        service.save(message);
        return new ResponseEntity<>(new SuccessMessage("Conversa reiniciada com Sucesso!", "id", id), HttpStatus.OK);
    }

    @PostMapping("/continue")
    public ResponseEntity<SuccessMessage> _continue(
            @RequestParam(value = "id") Long id, @RequestParam(value = "message") String phrase) 
    {
        Message before = service.get(id);
        User user = getContextUser();
        
        before.getUserMessageStatus().forEach((status) -> {
            if (user.equals(status.getUser()) || user.equals(before.getFrom()))
                status.setStatus(1);
        });

        List<UserMessageStatus> userMessageStatus = new ArrayList<>();
        for (User notifyUser : before.getNotification().getUsers()) {
            if (!notifyUser.equals(user)) {
                UserMessageStatus status = new UserMessageStatus();
                status.setStatus(0);
                status.setUser(notifyUser);
                userMessageStatus.add(status);
            }
        }

        Message after = new Message();
        after.setPhrase(phrase);
        after.setNotification(before.getNotification());
        after.setFrom(user);
        after.setUserMessageStatus(userMessageStatus);

        service.save(after, before);
        return new ResponseEntity<>(new SuccessMessage("Mensagem enviada com Sucesso!", "id", id), HttpStatus.OK);
    }

}
