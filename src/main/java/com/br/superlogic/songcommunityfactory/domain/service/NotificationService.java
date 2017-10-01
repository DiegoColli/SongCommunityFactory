package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface NotificationService {

    public List<Notification> listNotificationsNotRead(User user);

    public void save(Notification notify);

    public Notification get(Long id);

    public void createContractFromNotification(Long id, User user);

}
