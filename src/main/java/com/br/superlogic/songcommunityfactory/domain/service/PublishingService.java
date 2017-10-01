
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.model.util.SearchPublishing;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface PublishingService {
        
    public List<Publishing> listBy(SearchPublishing search);
    
}
