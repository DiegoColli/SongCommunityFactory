package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ProjectResourceDao;
import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectResourceService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("projectResourceService")
@Transactional
public class ProjectResourceServiceImpl implements ProjectResourceService {

    @Autowired
    @Qualifier("projectResourceDao")
    private ProjectResourceDao dao;

    @Override
    public void write(ProjectResource resource) throws IOException, RuntimeException {
        dao.write(resource);
    }

    @Override
    public ProjectResource get(Long id)
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
