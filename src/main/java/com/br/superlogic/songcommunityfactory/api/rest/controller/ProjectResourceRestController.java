package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectResourceService;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/project/resource")
public class ProjectResourceRestController extends SimpleRestController {

    @Autowired
    @Qualifier("projectResourceService")
    private ProjectResourceService service;

    @PostMapping(value = "/upload", headers = ("content-type=multipart/*"), consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<SuccessMessage> uploadFile(@RequestParam("file") MultipartFile uploadfile) throws IOException 
    {

        if (uploadfile.isEmpty()) {
            throw new IllegalArgumentException("Arquivo não fornecido!");
        }

        ProjectResource resource = new ProjectResource();
        resource.setUser(getContextUser());
        resource.setBytes(uploadfile.getBytes());
        resource.setName(uploadfile.getOriginalFilename());

        service.write(resource);

        return new ResponseEntity<>(new SuccessMessage("Arquivo armazenado com Sucesso!"), HttpStatus.OK);
    }

}
