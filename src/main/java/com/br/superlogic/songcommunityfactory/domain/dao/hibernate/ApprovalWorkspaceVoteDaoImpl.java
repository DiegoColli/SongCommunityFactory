package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalWorkspaceVoteDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspaceVote;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("approvalWorkspaceVoteDao")
public class ApprovalWorkspaceVoteDaoImpl extends AbstractDao<Long, ApprovalWorkspaceVote> implements ApprovalWorkspaceVoteDao
{

    @Override
    public void save(ApprovalWorkspaceVote model)
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

}
