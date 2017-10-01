package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.FriendshipDao;
import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("friendshipDao")
public class FriendshipDaoImp extends AbstractDao<Long, Friendship> implements FriendshipDao {

    @Override
    public void save(List<Friendship> model) {
        model.forEach((friendship) -> {
            save(friendship);
        });
    }

    @Override
    public void save(Friendship model) {
        if (model.getId() != null && model.getId() > 0) {
            super.merge(model);
        } else {
            super.persist(model);
        }
    }

    @Override
    public Friendship get(User requester, User requested) {
        Friendship friendship;

        Predicate p1 = getCriteriaBuilder().and(
                getCriteriaBuilder().equal(getRoot().get("requester"), requester),
                getCriteriaBuilder().equal(getRoot().get("requested"), requested)
        );
        //or
        Predicate p2 = getCriteriaBuilder().and(
                getCriteriaBuilder().equal(getRoot().get("requester"), requested),
                getCriteriaBuilder().equal(getRoot().get("requested"), requester)
        );
        //equal
        Predicate p3 = getCriteriaBuilder().or(p1, p2);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(p3);

        friendship = this.getByPredicates(predicates);

        return friendship;
    }

}
