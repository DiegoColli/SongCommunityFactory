package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.SystemMessageDao;
import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.SystemMessageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("systemMessageService")
@Transactional
public class SystemMessageServiceImpl implements SystemMessageService
{

    @Autowired
    @Qualifier("systemMessageDao")
    private SystemMessageDao dao;

    @Override
    public List<SystemMessage> listNotRead(User user)
    {
        return dao.listNotRead(user);
    }

    @Override
    public void setRead(Long id)
    {
        SystemMessage message = dao.get(id);
        message.setReaded(Boolean.TRUE);        
        dao.save(message);
    }

}
