package com.br.superlogic.songcommunityfactory.domain.model.util;

import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import java.util.List;

/**
 *
 * @author Diego
 */
public class WorkspaceUpdateWrapper
{

    private Workspace workspace;

    private List<ProjectResource> newResources;

    private List<ProjectResource> udpateResources;

    private List<ProjectResource> deletedResources;

    public Workspace getWorkspace()
    {
        return workspace;
    }

    public void setWorkspace(Workspace workspace)
    {
        this.workspace = workspace;
    }

    public List<ProjectResource> getNewResources()
    {
        return newResources;
    }

    public void setNewResources(List<ProjectResource> newResources)
    {
        this.newResources = newResources;
    }

    public List<ProjectResource> getUdpateResources()
    {
        return udpateResources;
    }

    public void setUdpateResources(List<ProjectResource> udpateResources)
    {
        this.udpateResources = udpateResources;
    }

    public List<ProjectResource> getDeletedResources()
    {
        return deletedResources;
    }

    public void setDeletedResources(List<ProjectResource> deletedResources)
    {
        this.deletedResources = deletedResources;
    }

}
