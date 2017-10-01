package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalWorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
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
@Repository("approvalWorkspaceDao")
public class ApprovalWorkspaceDaoImpl extends AbstractDao<Long, ApprovalWorkspace> implements ApprovalWorkspaceDao
{

    @Override
    public List<ApprovalWorkspace> listOpen(Project project)
    {
        List<ApprovalWorkspace> approvals;

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
    public void save(ApprovalWorkspace model)
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
    public ApprovalWorkspace get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public List<ApprovalWorkspace> listOpen(User user)
    {
        return this.getSession().createNativeQuery(listOpenSql(user), ApprovalWorkspace.class).getResultList();
    }


    private String listOpenSql(User user) {
        String sql = "SELECT * FROM aproval_workspace WHERE \n"
                    + "_close = 0 AND deadLine < NOW() AND id IN "
                    + "(SELECT DISTINCT id_approval FROM aproval_workspace_vote WHERE id_user = "+user.getId()+" )";
        return sql;
    }
    
}
