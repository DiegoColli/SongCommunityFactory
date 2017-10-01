package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Cover;
import com.br.superlogic.songcommunityfactory.domain.service.PublishingResourceService;
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
@RequestMapping("api/publish/resource")
public class PublishResourceRestController extends SimpleRestController {

    @Autowired
    @Qualifier("publishingResourceService")
    private PublishingResourceService service;

    @PostMapping(value = "/upload/cover", headers = ("content-type=multipart/*"), consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<SuccessMessage> uploadCover(@RequestParam("file") MultipartFile uploadfile) throws IOException 
    {
        if (uploadfile.isEmpty()) {
            throw new IllegalArgumentException("Arquivo não fornecido!");
        }

        Cover cover = new Cover();       
        cover.setBytes(uploadfile.getBytes());
        cover.setName(uploadfile.getOriginalFilename());
        service.write(cover, getContextUser());

        return new ResponseEntity<>(new SuccessMessage("Arquivo armazenado com Sucesso! "+cover.getName()), HttpStatus.OK);
    }

}
