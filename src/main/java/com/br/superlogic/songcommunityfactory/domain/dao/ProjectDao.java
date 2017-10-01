package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ProjectDao {

    Project get(Long id);
    
    Project get(User user, Long id);

    void save(Project model) throws RuntimeException;

    void delete(Project model) throws RuntimeException;

    List<Project> list(User user);

}
