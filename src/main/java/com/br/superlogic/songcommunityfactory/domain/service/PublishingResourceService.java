
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Cover;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.io.IOException;

/**
 *
 * @author Diego
 */
public interface PublishingResourceService {
        
    public void write(Cover cover, User user) throws IOException, RuntimeException;

    
}
