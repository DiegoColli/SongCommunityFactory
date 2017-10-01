package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.dao.WorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("workspaceDao")
public class WorkspaceDaoImp extends AbstractDao<Long, Workspace> implements WorkspaceDao
{

    @Override
    public Workspace get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public void save(Workspace model) throws RuntimeException
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
    public void delete(Workspace model)
    {
        super.delete(model);
    }

    @Override
    public Workspace getNewestPrincipal(Project project)
    {
        return this.getSession().createNativeQuery(getSql(project), Workspace.class).getSingleResult();
    }

    private String getSql(Project project)
    {
        Long id = project.getId();
        return "SELECT * FROM workspace WHERE id_project = "+id+" AND principal = 1 ORDER BY version DESC, id DESC LIMIT 1";
    }

}
