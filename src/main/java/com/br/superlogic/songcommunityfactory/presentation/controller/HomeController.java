package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalPublishingService;
import com.br.superlogic.songcommunityfactory.domain.service.ApprovalWorkspaceService;
import com.br.superlogic.songcommunityfactory.domain.service.HelpService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.br.superlogic.songcommunityfactory.domain.service.NotificationService;
import com.br.superlogic.songcommunityfactory.domain.service.SystemMessageService;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Diego
 */
@Controller
@RequestMapping("home")
public class HomeController extends SimpleController {

    private final String path = "home/";

    @Autowired
    @Qualifier("helpService")
    private HelpService helpService;
    
    @Autowired
    @Qualifier("notificationService")
    private NotificationService notifyService;
    
    @Autowired
    @Qualifier("systemMessageService")
    SystemMessageService sysMessageService;
    
    @Autowired
    @Qualifier("approvalWorkspaceService")
    ApprovalWorkspaceService approvalWorkspaceService;
    
    @Autowired
    @Qualifier("approvalPublishingService")
    ApprovalPublishingService approvalPublishingService;

    @GetMapping("/start")
    public String start(@RequestParam(value = "interval", required = false, defaultValue = "15") Integer interval, ModelMap model) 
    {   
        try
        {
            approvalPublishingService.update(getContextUser());
        }
        catch (IOException ex)
        {
            model.addAttribute("warning", ex.getMessage());
        }
        
        approvalWorkspaceService.update(getContextUser());
        
        model.addAttribute("interval", interval);
        model.addAttribute("user", getContextUser());
        model.addAttribute("systemMessages", sysMessageService.listNotRead(getContextUser()));
        model.addAttribute("myHelps", helpService.listMyHelpRequests(getContextUser()));
        model.addAttribute("otherHelps", helpService.listOthersHelpReqWithoutMyHelp(getContextUser(), interval));
        model.addAttribute("notifications", notifyService.listNotificationsNotRead(getContextUser()));

        List<HelpResponse>  myAnswersAnsweredAccepted= new ArrayList<>();
        List<HelpResponse>  myAnswersAnsweredRefused = new ArrayList<>();
        List<HelpResponse> myAnswersAnswered = helpService.listMyAnswersAnswered(getContextUser());                
        if(myAnswersAnswered != null)//I now the dao at the end will return a list with 0, but I still test
        {
            for (HelpResponse response : myAnswersAnswered) {
                if(response.getStatus() == 1)
                {
                    myAnswersAnsweredAccepted.add(response);
                }
                else if(response.getStatus() == 2)
                {
                    myAnswersAnsweredRefused.add(response);
                }
            }
        }        
        model.addAttribute("accepts", myAnswersAnsweredAccepted);
        model.addAttribute("refuses", myAnswersAnsweredRefused);
        
        //retorna o jsp
        return path + "start";
    }

}
