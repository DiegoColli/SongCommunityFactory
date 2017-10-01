package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.ProjectResource;
import com.br.superlogic.songcommunityfactory.domain.service.ProjectResourceService;
import javax.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Diego
 * 
 * WE DONT USE, ITS JUST A EXAMPLE, AND IT DOESNOT WORK
 */
@Controller
@RequestMapping("download")
public class DownloadController
{
    @Autowired
    @Qualifier("projectResourceService")
    private ProjectResourceService service;

    @GetMapping("/project/file")
    public Response download(@RequestParam(value = "id") Long id)
    {
        ProjectResource resource = service.get(id);
        resource.getPath();
        return Response.ok(resource, "application/octet-stream")
            .header("Content-disposition", "attachment; filename=mypdf.pdf").build();
    }
}
