package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import org.springframework.stereotype.Repository;
import com.br.superlogic.songcommunityfactory.configuration.AppConfig;
import com.br.superlogic.songcommunityfactory.domain.dao.CoverDao;
import com.br.superlogic.songcommunityfactory.domain.model.Cover;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.io.IOException;


/**
 *
 * @author Diego
 */
@Repository("coverDao")
public class CoverDaoImp extends AbstractDao<Long, Cover> implements CoverDao
{

    @Override
    public void write(Cover model, User user) throws IOException
    {
        String basePath = AppConfig.getPropertiy("path.uploads") + "users/temp/" + user.getId();
        ResourceDao.createDirsIfNotExist(basePath);
        String filePath = basePath + "/" + model.getName();
        ResourceDao.write(filePath, model.getBytes());
        model.setPath(filePath);
    }

    @Override
    public void moveUserTempToPublic(Cover model, User user) throws IOException
    {
        String from = AppConfig.getPropertiy("path.uploads") + "users/temp/" + user.getId() + "/" + model.getName();
        String to = AppConfig.getPropertiy("path.uploads") + "publishing/" + model.getPublishing().getId();
        ResourceDao.createDirsIfNotExist(to);
        to += "/" + model.getName();
        ResourceDao.move(from, to);
        model.setPath(to);
    }
    
    
    @Override
    public void save(Cover model) throws RuntimeException
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
