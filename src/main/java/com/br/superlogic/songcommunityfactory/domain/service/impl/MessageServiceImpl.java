package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.dao.MessageDao;
import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import org.hibernate.Hibernate;
import com.br.superlogic.songcommunityfactory.domain.service.MessageService;

/**
 *
 * @author Diego
 */
@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService {

    @Autowired
    @Qualifier("messageDao")
    private MessageDao messageDao;
    
    
    @Autowired
    @Qualifier("notificationDao")
    private NotificationDao notificationDao;

    @Override
    public List<Message> listMessagesNotRead(User user) {
        List<Message> conversations = messageDao.listNotRead(user);
        return conversations;
    }

    @Override
    public Message get(Long id) {
        Message message = messageDao.get(id);
        Hibernate.initialize(message.getUserMessageStatus());
        Hibernate.initialize(message.getNotification());
        Hibernate.initialize(message.getNotification().getUsers());
        message.getUserMessageStatus().forEach((status) -> {
            Hibernate.initialize(status.getUser());
        });
        return message;
    }

    @Override
    public void save(Message message){
        messageDao.save(message);
        notificationDao.save(message.getNotification());
    }


    @Override
    public void save(Message after, Message before) {
        messageDao.save(after);
        messageDao.save(before);
    }

}
