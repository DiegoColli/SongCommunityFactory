package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface MessageDao {

    public List<Message> listFrom(Notification notification, User user);
              
    public List<Message> listNotRead(User user);

    public Message get(Long id);

    public void save(Message conversation);
    
}
