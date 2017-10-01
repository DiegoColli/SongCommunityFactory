package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Cover;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.io.IOException;

/**
 *
 * @author Diego
 */
public interface CoverDao {

    public void write(Cover model, User user) throws IOException;

    public void moveUserTempToPublic(Cover model, User user) throws IOException;
    
    public void save(Cover cover);
    
}
