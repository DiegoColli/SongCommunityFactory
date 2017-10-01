package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
import com.br.superlogic.songcommunityfactory.domain.model.util.ComparisonStatus;
import com.br.superlogic.songcommunityfactory.domain.model.util.ComparisonStatusResult;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ResourceComparisonService;
import com.br.superlogic.songcommunityfactory.domain.service.WorkspaceService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping("comparison")
public class ComparisonController extends SimpleController
{

    private final String path = "comparison/";

    @Autowired
    @Qualifier("resourceComparisonService")
    private ResourceComparisonService comparisonService;
    
    
    @Autowired
    @Qualifier("workspaceService")
    private WorkspaceService workspaceService;
    

    @GetMapping("/approve/workspace/{id}")
    public String approve(@PathVariable("id") Long id, ModelMap model) throws IOException
    {
        Workspace workspace = workspaceService.getCompleteToComparison(id);
        
        if(workspace.getPrincipal())
            throw new RuntimeException("O espaço de trabalho: "+workspace.getName()+" já é um workspace principal!");
        
        List<ComparisonStatusResult> results = comparisonService.getComparisonForWorkspaceRequestApprove(id);        
        
        //set maps
        model.addAttribute("workspace", workspace);
        model.addAttribute("user", getContextUser());
        setComparisonModel(model, results);
        setSubmitOrVote(model, workspace);
        
        //retorna o jsp
        return path + "comparison";
    }
    
    private void setSubmitOrVote(ModelMap model, Workspace workspace)
    {
        //show submit or vote
        boolean open = false;
        if(workspace.getApprovals()!=null)
        {
            for (ApprovalWorkspace approval : workspace.getApprovals())
            {
                if(!approval.getClose())
                {
                    model.addAttribute("approval", approval);  
                    open = true;
                }                    
            }
        }
        if(open)
        {
            model.addAttribute("show_vote", true);        
        }
        else if(workspace.getOwner().equals(getContextUser()))
        {
            model.addAttribute("show_submit", true);
        }
    }
    
    private void setComparisonModel(ModelMap model, List<ComparisonStatusResult> results){
                List<ComparisonStatusResult>  equals  = new ArrayList<>();
        List<ComparisonStatusResult>  uniques = new ArrayList<>();
        List<ComparisonStatusResult>  names   = new ArrayList<>();
        List<ComparisonStatusResult>  contents = new ArrayList<>();        
        List<ComparisonStatusResult>  deletions= new ArrayList<>();        
        for (ComparisonStatusResult result : results)
        {
            if(result.getStatus() == ComparisonStatus.EQUAL)
                equals.add(result);
            if(result.getStatus() == ComparisonStatus.UNIQUE)
                uniques.add(result);
            if(result.getStatus() == ComparisonStatus.DIFFERENT_NAME)
                names.add(result);
            if(result.getStatus() == ComparisonStatus.DIFFERENT_CONTENT)
                contents.add(result);          
            if(result.getStatus() == ComparisonStatus.REVERSE_UNIQUE)
                deletions.add(result);          
        }
        
        model.addAttribute("equals", equals);
        model.addAttribute("uniques", uniques);
        model.addAttribute("names", names);
        model.addAttribute("contents", contents);
        model.addAttribute("deletions", deletions);
        model.addAttribute("user", getContextUser()); 
    }

}
