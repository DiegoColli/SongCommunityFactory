package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ProjectResourceDao {

    public void write(ProjectResource model) throws IOException;

    public void moveUserTempToProject(List<ProjectResource> models) throws IOException;

    public void moveUserTempToProject(ProjectResource model) throws IOException;
    
    public void save(ProjectResource model) throws RuntimeException;

    public void save(List<ProjectResource> models) throws RuntimeException;

    public void delete(ProjectResource resource);

    public void erase(ProjectResource resource);

    public ProjectResource get(Long id);

    public void copy(ProjectResource original, ProjectResource copy) throws IOException;
    
}
