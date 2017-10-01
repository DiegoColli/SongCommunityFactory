package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.model.util.SearchPublishing;
import com.br.superlogic.songcommunityfactory.domain.service.PublishingService;
import com.br.superlogic.songcommunityfactory.domain.service.StyleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Diego
 */
@Controller
@RequestMapping("public")
public class PublicController
{

    private final String path = "public/";

    @Autowired
    @Qualifier("styleService")
    private StyleService styleService;

    @Autowired
    @Qualifier("publishingService")
    private PublishingService publishingService;

    @GetMapping("/joinUs")
    public String joinUs(ModelMap model)
    {
        //retorna o jsp
        model.addAttribute("styles", styleService.list());
        return path + "join-us";
    }

    @GetMapping("/this")
    public String _this()
    {
        return path + "what_is_this";
    }

    @GetMapping("/about")
    public String about()
    {
        return path + "about";
    }

    @GetMapping("/news")
    public String news(ModelMap model)
    {
        List<Publishing> publishings = publishingService.listBy(null);

        model.addAttribute("styles", styleService.list());
        model.addAttribute("models", publishings);
        model.addAttribute("search", new SearchPublishing());
        
        return path + "news";
    }

    @GetMapping("/news/find")
    public String find(SearchPublishing search, ModelMap model)
    {
        List<Publishing> publishings = publishingService.listBy(search);

        model.addAttribute("styles", styleService.list());
        model.addAttribute("models", publishings);        
        model.addAttribute("search", search);
        
        return path + "news";
    }

    @GetMapping("/forgotPassword")
    public String forgetPassword(ModelMap model)
    {
        return path + "forgot-password";
    }
}
