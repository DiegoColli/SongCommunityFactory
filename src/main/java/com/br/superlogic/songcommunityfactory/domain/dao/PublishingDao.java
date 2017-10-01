package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.model.util.SearchPublishing;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface PublishingDao {

    Publishing get(Long id);

    void save(Publishing model) throws RuntimeException;

    public List<Publishing> listBy(SearchPublishing search);
}
