package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ProjectHistoryDao;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectHistory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("projectHistoryDao")
public class ProjectHistoryDaoImp extends AbstractDao<Long, ProjectHistory> implements ProjectHistoryDao {

    @Override
    public void save(ProjectHistory model) throws RuntimeException {
        if (model.getId() != null && model.getId() > 0) {
            super.merge(model);
        } else {
            super.persist(model);
        }
    }

}
