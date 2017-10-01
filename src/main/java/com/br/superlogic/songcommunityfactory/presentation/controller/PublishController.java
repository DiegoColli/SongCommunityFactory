package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalPublishingService;
import com.br.superlogic.songcommunityfactory.domain.service.StyleService;
import com.br.superlogic.songcommunityfactory.domain.service.WorkspaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Diego
 */
@Controller
@RequestMapping("publish")
public class PublishController extends SimpleController
{

    private final String path = "publish/";

    @Autowired
    @Qualifier("workspaceService")
    private WorkspaceService service;
    
    
    @Autowired
    @Qualifier("approvalPublishingService")
    private ApprovalPublishingService approvalService;
    
    @Autowired
    @Qualifier("styleService")
    private StyleService styleService;
    
    @GetMapping("/approve/{id}")
    public String approve(@PathVariable("id") Long id, ModelMap model)
    {
        Workspace workspace = service.getCompleteToPublish(id);

        if (!workspace.getPrincipal())
        {
            throw new RuntimeException("O espaço de trabalho: " + workspace.getName() + " escolhido não é um workspace principal!");
        }

        //set maps
        model.addAttribute("workspace", workspace);
        model.addAttribute("user", getContextUser());        
        model.addAttribute("styles", styleService.list());

        //retorna o jsp
        return path + "submit";
    }

    @GetMapping("/solicitation/publishing/{id}")
    public String approvePublishing(@PathVariable("id") Long id, ModelMap model)
    {
        ApprovalPublishing approval = approvalService.getComplete(id);

        if (approval.getClose())
        {
            throw new RuntimeException("A Aprovação: " + approval.getPublishing().getTitle() + " esta fechada!");
        }

        model.addAttribute("user", getContextUser());
        model.addAttribute("approval", approval);
        
        //retorna o jsp
        return path + "vote";
    }
}
