package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface NotificationDao {

    public List<Notification> listNotRead(User user);

    public List<Notification> listFrom(Project project, User user);

    public void save(Notification notify);

    public Notification get(Long id);

}
