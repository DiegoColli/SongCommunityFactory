package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishingVote;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalPublishingService;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/approve")
public class ApprovalPublishingRestController extends SimpleRestController {

    @Autowired
    @Qualifier("approvalPublishingService")
    private ApprovalPublishingService service;
    
    
    @PostMapping("/publishing/submit")
    public ResponseEntity<SuccessMessage> publishingSubmit(@RequestBody ApprovalPublishing approval) throws IOException 
    {        
        approval.setRequester(getContextUser());        
        approval.getPublishing().setApproval(approval);
        service.submitPublishing(approval);        
        return new ResponseEntity<>(new SuccessMessage("Publicação submetida à aprovação com Sucesso!"), HttpStatus.OK);
    }

    
    @PostMapping("/publishing/vote")
    public ResponseEntity<SuccessMessage> vote(@RequestBody ApprovalPublishingVote vote) throws IOException 
    {        
        service.vote(vote);
        return new ResponseEntity<>(new SuccessMessage("Voto contabilizado com Sucesso!"), HttpStatus.OK);
    }
    
}
