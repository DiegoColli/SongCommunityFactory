package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.PublishingDao;
import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.model.PublishingItem;
import com.br.superlogic.songcommunityfactory.domain.model.util.SearchPublishing;
import com.br.superlogic.songcommunityfactory.domain.service.PublishingService;
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
@Service("publishingService")
@Transactional
public class PublishingServiceImpl implements PublishingService {

    @Autowired
    @Qualifier("publishingDao")
    private PublishingDao dao;

    @Override
    public List<Publishing> listBy(SearchPublishing search)
    {
        List<Publishing> publishings = dao.listBy(search);
        
        for (Publishing publishing : publishings)
        {
            for (PublishingItem item : publishing.getItems())
            {
                Hibernate.initialize(item.getPublicResource());
            }            
        }
        
        return publishings;
    }

}
