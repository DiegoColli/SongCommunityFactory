package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.configuration.AppConfig;
import org.springframework.stereotype.Repository;
import com.br.superlogic.songcommunityfactory.domain.dao.PublicResourceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.model.PublicResource;
import com.br.superlogic.songcommunityfactory.domain.model.PublishingItem;
import java.io.IOException;
import java.util.List;


/**
 *
 * @author Diego
 */
@Repository("publicResourceDao")
public class PublicResourceDaoImp extends AbstractDao<Long, PublicResource> implements PublicResourceDao
{

    @Override
    public void save(List<PublicResource> models) throws RuntimeException
    {
        models.forEach((model) ->
        {
            save(model);
        });
    }
    
    @Override
    public void save(PublicResource model) throws RuntimeException
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
    public void publish(PublishingItem publish) throws IOException
    {
        String to = AppConfig.getPropertiy("path.uploads") + "publishing/" + publish.getPublishing().getId() ;        
        ResourceDao.createDirsIfNotExist(to);
        
        PublicResource resource = new PublicResource();
        resource.setName(publish.getProjectResource().getName());
        resource.setPath(to+"/"+resource.getName());
        
        publish.setPublicResource(resource);
        
        ResourceDao.copy(publish.getProjectResource().getPath(), publish.getPublicResource().getPath());
        
        save(resource);        
    }

    
    
}
