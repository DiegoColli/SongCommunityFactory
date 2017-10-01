package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;

/**
 *
 * @author Diego
 */
public interface WorkspaceDao
{

    Workspace get(Long id);
    
    Workspace getNewestPrincipal(Project project);

    void save(Workspace model) throws RuntimeException;

    void delete(Workspace model) throws RuntimeException;

}
