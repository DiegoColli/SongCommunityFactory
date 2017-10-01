package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.NotificationDao;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("notificationDao")
public class NotificationDaoImp extends AbstractDao<Long, Notification> implements NotificationDao {

    @Override
    public List<Notification> listNotRead(User user) {
        return this.getSession().createNativeQuery(listNotReadSql(user), Notification.class).getResultList();

    }

    private String listNotReadSql(User user) {
        String sql = ""
                + "SELECT DISTINCT * FROM notification WHERE _open = 1 \n" //OPEN
                //PART OF THE GROUP
                + "AND id IN  (SELECT id_notification FROM user_notification WHERE id_user = " + user.getId() + ")\n"                
                + "AND id IN ( \n"                
                //I DONT NEED THAT MESSAGES THAT I SEND
                    + " SELECT id_notification FROM message WHERE id_from != " + user.getId() + "\n"
                    + " AND id IN (\n"
                    //I NEED THAT ARE FOR ME AND ARE STILL OPEN
                    + " SELECT id_message FROM user_message_status WHERE \n"
                    + " id_message = message.id AND id_user = " + user.getId() + "\n"
                    + " AND (status IS null OR status = 0) \n"
                    + " )\n"
                + ")";

        return sql;
    }

    @Override
    public List<Notification> listFrom(Project project, User user) {
        return this.getSession().createNativeQuery(listFromSql(project, user), Notification.class).getResultList();
    }

    private String listFromSql(Project project, User user) {
        String sql = "SELECT DISTINCT * FROM notification "
            + " WHERE id_project = " + project.getId() + " AND id IN "
            + " (SELECT id_notification FROM user_notification WHERE id_user = " + user.getId() + ")";

        return sql;
    }

    @Override
    public void save(Notification model) {
        if (model.getId() != null && model.getId() > 0) {
            super.merge(model);
        } else {
            super.persist(model);
        }
    }

    @Override
    public Notification get(Long id) {
        return super.getByKey(id);
    }

}
