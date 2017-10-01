package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.service.SystemMessageService;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/system")
public class SystemMessageRestController extends SimpleRestController
{

    @Autowired
    @Qualifier("systemMessageService")
    SystemMessageService service;

    @PostMapping("/message/read")
    public ResponseEntity<SuccessMessage> read(@RequestParam(value = "id") Long id)
    {
        service.setRead(id);
        return new ResponseEntity<>(new SuccessMessage("Mensagem lida com Sucesso!"), HttpStatus.OK);
    }

}
