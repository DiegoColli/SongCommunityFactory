package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspaceVote;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalWorkspaceService;
import com.br.superlogic.songcommunityfactory.domain.service.WorkspaceService;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/approve")
public class ApproveWorkspaceRestController extends SimpleRestController {

    @Autowired
    @Qualifier("approvalWorkspaceService")
    private ApprovalWorkspaceService service;
    
    @Autowired
    @Qualifier("workspaceService")
    private WorkspaceService workspaceService;
    
    @PostMapping("/workspace/submit")
    public ResponseEntity<SuccessMessage> workspaceSubmit(
            @RequestParam(value = "id") Long id, @RequestParam(value = "description") String description) 
    {
        
        Workspace workspace = workspaceService.get(id);
        
        if(!workspace.getOwner().equals(getContextUser()))
            throw new IllegalArgumentException("Esse espaço de trabalho não pertence ao usuário logado!");
        
        service.submitWorkspace(workspace, description);
        
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho submetido à aprovação com Sucesso!", "id", id), HttpStatus.OK);
    }

    
    @PostMapping("/workspace/vote")
    public ResponseEntity<SuccessMessage> vote(@RequestBody ApprovalWorkspaceVote vote) 
    {        
        service.vote(vote);
        return new ResponseEntity<>(new SuccessMessage("Voto contabilizado com Sucesso!"), HttpStatus.OK);
    }
    
}
