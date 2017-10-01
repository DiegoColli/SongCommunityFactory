/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import java.io.IOException;

/**
 *
 * @author Diego
 */
public interface ProjectResourceService {
        
    public void write(ProjectResource resource) throws IOException, RuntimeException;

    public ProjectResource get(Long id);
    
}
