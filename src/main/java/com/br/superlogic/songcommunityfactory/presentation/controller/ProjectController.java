package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectService;
import com.br.superlogic.songcommunityfactory.domain.service.UserDetailsServiceScf;
import java.util.ArrayList;
import java.util.Comparator;
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
@RequestMapping("project")
public class ProjectController extends SimpleController {

    private final String path = "project/template";

    @Autowired
    @Qualifier("projectService")
    private ProjectService service;
    
    @Autowired
    @Qualifier("userDetailsService")
    private UserDetailsServiceScf userService;

    @GetMapping("/all")
    public String all(ModelMap model) 
    {
        model.addAttribute("user", getContextUser());
        model.addAttribute("summaryProjects", service.listSummaryProjects(getContextUser()));       
        model.addAttribute("pag","all");
        return path;
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable("id") Long id, ModelMap model) 
    {
        setCommumModelMap(model);
        User user = (User) model.get("user");
        Project project = service.getProject(getContextUser(), id);
        model.addAttribute("model", project);
        
        List<Workspace> principals = new ArrayList<>();
        List<Workspace> others = new ArrayList<>();
        for (Workspace workspace : project.getWorkspaces())
        {
            if(workspace.getPrincipal())
                principals.add(workspace);
            else if(workspace.getOwner().equals(user))
                others.add(workspace);
        }
        
        principals.sort(Comparator.comparingDouble(Workspace::getVersion));
        others.sort(Comparator.comparingDouble(Workspace::getVersion));
        
        model.addAttribute("workPrincipals", principals);
        model.addAttribute("workOthers", others);        
        model.addAttribute("pag","update");
        return path;
    }

    @GetMapping("/new")
    public String _new(ModelMap model) 
    {
        setCommumModelMap(model);
        model.addAttribute("pag","new");
        return path;
    }
       
    private void setCommumModelMap(ModelMap model) 
    {
        model.addAttribute("types", service.listTypes());
        model.addAttribute("styles", service.listStyles());
        model.addAttribute("user", userService.getUserData(getContextUser()));
        //this is most used for just  have a model in json
        model.addAttribute("base_project", gson.toJson(new Project(), Project.class));
        model.addAttribute("base_workspace", gson.toJson(new Workspace(), Workspace.class));
    }

}
