package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ContractDao;
import com.br.superlogic.songcommunityfactory.domain.dao.FriendshipDao;
import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import com.br.superlogic.songcommunityfactory.domain.model.Contract;
import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.br.superlogic.songcommunityfactory.domain.service.NotificationService;
import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Hibernate;

/**
 *
 * @author Diego
 */
@Service("notificationService")
@Transactional
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    @Qualifier("notificationDao")
    private NotificationDao dao;

    @Autowired
    @Qualifier("contractDao")
    private ContractDao contractDao;

    @Autowired
    @Qualifier("friendshipDao")
    private FriendshipDao friendshipDao;

    @Override
    public List<Notification> listNotificationsNotRead(User user) {
        //all notifications that have some conversation to user where the user not read yet
        List<Notification> _list = dao.listNotRead(user);

        _list.forEach((notification) -> {
            Hibernate.initialize(notification.getMessages());
            Hibernate.initialize(notification.getProject());
        });

        return _list;
    }

    @Override
    public void save(Notification notify) {
        dao.save(notify);
    }

    @Override
    public Notification get(Long id) {
        Notification notification = dao.get(id);
        Hibernate.initialize(notification.getProject());
        return notification;
    }

    @Override
    public void createContractFromNotification(Long id, User user) {

        Notification notification = dao.get(id);
        notification.setInvite(Boolean.FALSE);
        notification.setProjLink(Boolean.TRUE);
        dao.save(notification);

        //create contract
        Contract contract = new Contract();
        contract.setProject(notification.getProject());
        contract.setWorker(user);
        
        //save if not exists
        if (!notification.getProject().getContracts().contains(contract)) {            
            contractDao.save(contract);
        }

        //create friendship        
        try {
            //if doesnt have a preview friendship, this method will throw an excption
            friendshipDao.get(notification.getProject().getOwner(), user);
        } catch (NoResultException nre) {
            Friendship friendship = new Friendship();
            friendship.setRequester(notification.getProject().getOwner());
            friendship.setRequested(user);
            friendship.setStatus(1);
            friendshipDao.save(friendship);
        }
    }

}
