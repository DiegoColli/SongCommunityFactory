package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.model.util.WorkspaceUpdateWrapper;
import java.io.IOException;

/**
 *
 * @author Diego
 */
public interface WorkspaceService
{

    void createWorkspaceFromBase(Workspace workspace) throws IOException;
    
    void update(Workspace workspace);

    void update(WorkspaceUpdateWrapper wrapper) throws IOException;

    public void submit(WorkspaceUpdateWrapper wrapper) throws IOException;

    public void delete(Long id);

    public Workspace get(Long id);
    
    public Workspace getCompleteToComparison(Long id);

    public Workspace getCompleteToPublish(Long id);
}
