package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.dao.UserDao;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("userDao")
public class UserDaoImp extends AbstractDao<Long, User> implements UserDao
{

    @Autowired
    @Qualifier("passwordEncoder")
    PasswordEncoder passwordEncoder;

    @Override
    public User get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public void save(User model) throws RuntimeException
    {

        if (model.isCryptPassword())
        {
            model.setPassword(passwordEncoder.encode(model.getPassword()));
        }
        if (model.getId() != null && model.getId() > 0)
        {
            super.merge(model);
        }
        else
        {
            super.persist(model);
        }
    }

    @Override
    public void delete(User model)
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User getByName(String name)
    {
        return this.getByColumn("username", name);
    }

    @Override
    public boolean alreadyExistsName(String name)
    {
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("username"), name)
        );

        return !this.listByPredicates(predicates).isEmpty();
    }

    @Override
    public boolean alreadyExistsName(String name, Long id)
    {
        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("username"), name)
        );
        predicates.add(
                getCriteriaBuilder().notEqual(getRoot().get("id"), id)
        );

        return !this.listByPredicates(predicates).isEmpty();
    }

    @Override
    public User getByEmail(String email)
    {
        return this.getByColumn("email", email);
    }

}
