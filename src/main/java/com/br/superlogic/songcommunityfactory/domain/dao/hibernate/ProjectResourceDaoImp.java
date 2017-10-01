package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.ProjectResourceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import org.springframework.stereotype.Repository;
import com.br.superlogic.songcommunityfactory.configuration.AppConfig;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Diego
 */
@Repository("projectResourceDao")
public class ProjectResourceDaoImp extends AbstractDao<Long, ProjectResource> implements ProjectResourceDao
{

    @Override
    public void write(ProjectResource model) throws IOException
    {
        String basePath = AppConfig.getPropertiy("path.uploads") + "users/temp/" + model.getUser().getId();
        ResourceDao.createDirsIfNotExist(basePath);
        String filePath = basePath + "/" + model.getName();
        ResourceDao.write(filePath, model.getBytes());
        model.setPath(filePath);
    }

    @Override
    public void moveUserTempToProject(List<ProjectResource> models) throws IOException
    {
        for (ProjectResource model : models)
        {
            moveUserTempToProject(model);
        }
    }

    @Override
    public void moveUserTempToProject(ProjectResource model) throws IOException
    {
        String from = AppConfig.getPropertiy("path.uploads") + "users/temp/" + model.getUser().getId() + "/" + model.getName();
        String to = AppConfig.getPropertiy("path.uploads") + "projects/" + model.getProject().getId() + "/" + model.getWorkspace().getId();
        ResourceDao.createDirsIfNotExist(to);
        to += "/" + model.getId() + model.getName().substring(model.getName().lastIndexOf("."), model.getName().length());
        ResourceDao.move(from, to);
        model.setPath(to);
    }

    @Override
    public void copy(ProjectResource original, ProjectResource copy) throws IOException
    {
        String to = AppConfig.getPropertiy("path.uploads") + "projects/" + copy.getProject().getId() + "/" + copy.getWorkspace().getId();
        ResourceDao.createDirsIfNotExist(to);
        ResourceDao.copy(original.getPath(), copy.getPath());
    }

    @Override
    public void save(ProjectResource model) throws RuntimeException
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
    public void save(List<ProjectResource> models) throws RuntimeException
    {
        models.forEach((model) ->
        {
            save(model);
        });
    }

    @Override
    public void delete(ProjectResource resource)
    {
        super.delete(resource);
    }

    @Override
    public void erase(ProjectResource resource)
    {
        try
        {
            ResourceDao.erase(resource.getPath());
        }
        catch (IOException ex)
        {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public ProjectResource get(Long id)
    {
        return super.getByKey(id);
    }

}
