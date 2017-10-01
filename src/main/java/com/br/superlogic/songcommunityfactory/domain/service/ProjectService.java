
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.Style;
import com.br.superlogic.songcommunityfactory.domain.model.util.SummaryProject;
import com.br.superlogic.songcommunityfactory.domain.model.Type;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ProjectService {
        
    List<Project> listProjects(User user);
    
    List<SummaryProject> listSummaryProjects(User user);
    
    Project getProject(User user, Long projId);
    
    List<Type> listTypes();
    
    List<Style> listStyles();
    
    void insert(Project project) throws IOException;

    void update(Project project);
}
