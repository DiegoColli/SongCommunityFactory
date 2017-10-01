package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.SystemMessageDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.SystemMessage;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("systemMessageDao")
public class SystemMessageDaoImpl extends AbstractDao<Long, SystemMessage> implements SystemMessageDao
{

    @Override
    public void save(SystemMessage model)
    {
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
    public List<SystemMessage> listNotRead(User user)
    {
        List<SystemMessage> messsages;

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("to"), user)
        );
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("readed"), false)
        );

        messsages = this.listByPredicates(predicates);

        return messsages;
    }

    @Override
    public SystemMessage get(Long id)
    {
        return super.getByKey(id);
    }

}
