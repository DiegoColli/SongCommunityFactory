package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface MessageService {

    public List<Message> listMessagesNotRead(User user);

    public Message get(Long id);

    public void save(Message message);

    public void save(Message after, Message before);
    
}
