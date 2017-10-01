package com.br.superlogic.songcommunityfactory.presentation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Diego
 */
@Controller
public class IndexController {

    @GetMapping({"/", "/index"})
    public String index() {      
        //retorna o jsp
        return "index";
    }
        
    @GetMapping("/login")        
    public String signIn (
            @RequestParam(value = "error", required = false) String error, 
            @RequestParam(value = "logout", required = false) String logout,
            Model model){      
        
        if (error != null) 
            model.addAttribute("danger", "Nome e/ou senha inválidos! "+error);
        
        if (logout != null) 
            model.addAttribute("success", "Você foi deslogado com sucesso!");
        
        //retorna o jsp
        return "login";
    }
        
}
