package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface SystemMessageService {

    public List<SystemMessage> listNotRead(User user);
    
    public void setRead(Long id);

}
