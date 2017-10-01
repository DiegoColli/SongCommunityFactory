package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.User;

/**
 *
 * @author Diego
 */
public interface UserDao {

    User get(Long id);

    void save(User model) throws RuntimeException;

    User getByName(String name);
    
    User getByEmail(String email);
    
    boolean alreadyExistsName(String name);
    
    boolean alreadyExistsName(String name, Long id);
}
