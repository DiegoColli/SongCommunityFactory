package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.Message;
import com.br.superlogic.songcommunityfactory.domain.model.Notification;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;
import com.br.superlogic.songcommunityfactory.domain.dao.MessageDao;

/**
 *
 * @author Diego
 */
@Repository("messageDao")
public class MessageDaoImp extends AbstractDao<Long, Message> implements MessageDao {

    @Override
    public List<Message> listNotRead(User user) {
        Predicate p1 = getCriteriaBuilder().and(
                getCriteriaBuilder().isNull(getRoot().get("read")),
                getCriteriaBuilder().equal(getRoot().get("to"), user)
        );
        //or
        Predicate p2 = getCriteriaBuilder().and(
                getCriteriaBuilder().equal(getRoot().get("read"), 0),
                getCriteriaBuilder().equal(getRoot().get("to"), user)
        );
        //equal
        Predicate p3 = getCriteriaBuilder().or(p1, p2);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(p3);

        return this.listByPredicates(predicates);
    }

    @Override
    public List<Message> listFrom(Notification notification, User user) {
        Predicate p1 = getCriteriaBuilder().and(
                getCriteriaBuilder().equal(getRoot().get("notification"), notification),
                getCriteriaBuilder().equal(getRoot().get("to"), user)
        );
        //or
        Predicate p2 = getCriteriaBuilder().and(
                getCriteriaBuilder().equal(getRoot().get("notification"), notification),
                getCriteriaBuilder().equal(getRoot().get("from"), user)
        );
        //equal
        Predicate p3 = getCriteriaBuilder().or(p1, p2);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(p3);

        return this.listByPredicates(predicates);
    }

    @Override
    public Message get(Long id) {
        return getByKey(id);
    }

    @Override
    public void save(Message model) {
        if (model.getId() != null && model.getId() > 0) {
            merge(model);
        } else {
            persist(model);
        }
    }

}
