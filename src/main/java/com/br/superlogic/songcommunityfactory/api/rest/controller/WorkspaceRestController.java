package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.model.util.WorkspaceUpdateWrapper;
import com.br.superlogic.songcommunityfactory.domain.service.WorkspaceService;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.io.IOException;
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
@RequestMapping("api/workspace")
public class WorkspaceRestController extends SimpleRestController
{

    @Autowired
    @Qualifier("workspaceService")
    private WorkspaceService service;

    @PostMapping("/new")
    public ResponseEntity<SuccessMessage> create(@RequestBody Workspace workspace) throws IOException
    {
        service.createWorkspaceFromBase(workspace);
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho Criado com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/update/principal")
    public ResponseEntity<SuccessMessage> updatePrincipal(@RequestBody Workspace wrapper) throws IOException
    {
        service.update(wrapper);
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho Alterado com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/update")
    public ResponseEntity<SuccessMessage> update(@RequestBody WorkspaceUpdateWrapper wrapper) throws IOException
    {
        service.update(wrapper);
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho Alterado com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/submit")
    public ResponseEntity<SuccessMessage> submit(@RequestBody WorkspaceUpdateWrapper wrapper) throws IOException
    {
        service.submit(wrapper);
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho Submetido à Aprovação com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping("/delete")
    public ResponseEntity<SuccessMessage> delete(@RequestParam(value = "id") Long id) throws IOException
    {
        service.delete(id);
        return new ResponseEntity<>(new SuccessMessage("Espaço de Trabalho Excluído com Sucesso!"), HttpStatus.OK);
    }
}
