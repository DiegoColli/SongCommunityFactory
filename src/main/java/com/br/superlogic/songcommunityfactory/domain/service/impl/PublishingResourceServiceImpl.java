package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.CoverDao;
import com.br.superlogic.songcommunityfactory.domain.model.Cover;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.PublishingResourceService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("publishingResourceService")
@Transactional
public class PublishingResourceServiceImpl implements PublishingResourceService {

    @Autowired
    @Qualifier("coverDao")
    private CoverDao coverdao;

    @Override
    public void write(Cover cover, User user) throws IOException, RuntimeException {
        coverdao.write(cover, user);
    }

}
