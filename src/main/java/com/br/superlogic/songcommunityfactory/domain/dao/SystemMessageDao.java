
package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface SystemMessageDao
{
    public void save(SystemMessage message);

    public List<SystemMessage> listNotRead(User user);

    public SystemMessage get(Long id);
}
