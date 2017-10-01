package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalPublishingDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("approvalPublishingDao")
public class ApprovalPublishingDaoImpl extends AbstractDao<Long, ApprovalPublishing> implements ApprovalPublishingDao
{

    @Override
    public List<ApprovalPublishing> listOpen(Project project)
    {
        List<ApprovalPublishing> approvals;

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
            getCriteriaBuilder().equal(getRoot().get("project"), project)
        );
        predicates.add(
            getCriteriaBuilder().equal(getRoot().get("close"), false)
        );

        approvals = this.listByPredicates(predicates);

        return approvals;
    }

    @Override
    public void save(ApprovalPublishing model)
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
    public ApprovalPublishing get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public List<ApprovalPublishing> listOpen(User user)
    {
        return this.getSession().createNativeQuery(listOpenSql(user), ApprovalPublishing.class).getResultList();
    }

    
    private String listOpenSql(User user) {
        String sql = "SELECT * FROM aproval_publishing WHERE \n"
                    + "_close = 0 AND deadLine < NOW() AND id IN "
                    + "(SELECT DISTINCT id_approval FROM aproval_publishing_vote WHERE id_user = "+user.getId()+" )";
        return sql;
    }
    
}
