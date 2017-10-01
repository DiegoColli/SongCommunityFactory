package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ApprovalPublishingVoteDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishingVote;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("approvalPublishingVoteDao")
public class ApprovalPublishingVoteDaoImpl extends AbstractDao<Long, ApprovalPublishingVote> implements ApprovalPublishingVoteDao
{

    @Override
    public void save(ApprovalPublishingVote model)
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
