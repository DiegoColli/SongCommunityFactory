package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.PublicResource;
import com.br.superlogic.songcommunityfactory.domain.model.PublishingItem;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface PublicResourceDao {
    
    public void save(PublicResource model) throws RuntimeException;

    public void save(List<PublicResource> models) throws RuntimeException;

    public void publish(PublishingItem item) throws IOException;
    
}
