package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ProjectResourceDao;
import com.br.superlogic.songcommunityfactory.domain.dao.WorkspaceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspaceVote;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.model.util.WorkspaceUpdateWrapper;
import com.br.superlogic.songcommunityfactory.domain.service.WorkspaceService;
import java.io.IOException;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("workspaceService")
@Transactional
public class WorkspaceServiceImpl implements WorkspaceService
{

    @Autowired
    @Qualifier("workspaceDao")
    private WorkspaceDao dao;

    @Autowired
    @Qualifier("projectResourceDao")
    private ProjectResourceDao resourceDao;

    @Override
    public void createWorkspaceFromBase(Workspace workspace) throws IOException
    {
        dao.save(workspace);

        Workspace base = dao.get(workspace.getBase().getId());

        for (ProjectResource original : base.getResources())
        {
            ProjectResource copy = new ProjectResource();
            copy.setName(original.getName());
            copy.setProject(workspace.getProject());
            copy.setWorkspace(workspace);
            resourceDao.save(copy);
            resourceDao.copy(original, copy);
        }
    }

    @Override
    public void delete(Long id)
    {
        Workspace wk = dao.get(id);
        for (ProjectResource resource : wk.getResources())
        {
            resourceDao.erase(resource);
            resourceDao.delete(resource);
        }
        dao.delete(wk);
    }

    @Override
    public void update(Workspace workspace)
    {
        dao.save(workspace);
    }
    

    @Override
    public void submit(WorkspaceUpdateWrapper wrapper) throws IOException
    {
        throw  new RuntimeException("NOT YET");
    }

    @Override
    public void update(WorkspaceUpdateWrapper wrapper) throws IOException
    {
        Workspace wk = wrapper.getWorkspace();
        List<ProjectResource> newResources = wrapper.getNewResources();
        List<ProjectResource> updResources = wrapper.getUdpateResources();
        List<ProjectResource> delResources = wrapper.getDeletedResources();
        
        dao.save(wk);

        for (ProjectResource resource : newResources)
        {
            resource.setWorkspace(wk);
            resource.setProject(wk.getProject());
            resource.setUser(wk.getOwner());
        }
        resourceDao.save(newResources);
        resourceDao.moveUserTempToProject(newResources);

        for (ProjectResource resource : updResources)
        {
            resourceDao.erase(resourceDao.get(resource.getId()));
            resource.setWorkspace(wk);
            resource.setProject(wk.getProject());
            resource.setUser(wk.getOwner());
        }
        resourceDao.save(updResources);
        resourceDao.moveUserTempToProject(updResources);

        for (ProjectResource resource : delResources)
        {
            ProjectResource foo = resourceDao.get(resource.getId());
            resourceDao.erase(foo);
            resourceDao.delete(foo);
        }

    }

    @Override
    public Workspace get(Long id)
    {
        Workspace workspace = dao.get(id);
        Hibernate.initialize(workspace.getOwner());
        return workspace;
    }

    @Override
    public Workspace getCompleteToComparison(Long id)
    {
        Workspace workspace = dao.get(id);
        Hibernate.initialize(workspace.getProject());
        Hibernate.initialize(workspace.getOwner());        
        Hibernate.initialize(workspace.getApprovals());
        for (ApprovalWorkspace approval : workspace.getApprovals())
        {
            Hibernate.initialize(approval.getVotes());
            for (ApprovalWorkspaceVote vote : approval.getVotes())
            {
                Hibernate.initialize(vote.getUser());
            }
        }
        return workspace;
    }

    @Override
    public Workspace getCompleteToPublish(Long id)
    {
        Workspace workspace = dao.get(id);
        Hibernate.initialize(workspace.getProject());
        Hibernate.initialize(workspace.getOwner());        
        Hibernate.initialize(workspace.getResources());
        
        for (ProjectResource resource : workspace.getResources())
        {
            Hibernate.initialize(resource.getPublishings());            
        }
        
        return workspace;
    }

}
