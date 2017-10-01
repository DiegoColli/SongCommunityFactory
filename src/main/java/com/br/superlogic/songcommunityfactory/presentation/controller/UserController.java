
package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.StyleService;
import com.br.superlogic.songcommunityfactory.domain.service.UserDetailsServiceScf;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
@RequestMapping("user")
public class UserController extends SimpleController {

    private final String path = "user/";

    @Autowired
    @Qualifier("styleService")
    private StyleService styleService;

    @Autowired
    @Qualifier("userDetailsService")
    private UserDetailsServiceScf userService;

    @GetMapping("/update")
    public String update(ModelMap model) {        
        User user = userService.getUserData(getContextUser());
        model.addAttribute("user", user);//yes are the same
        model.addAttribute("model", user);
        model.addAttribute("styles", styleService.list());
        return path + "update";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        if (getAuthentication() != null) {
            new SecurityContextLogoutHandler().logout(request, response, getAuthentication());
            model.addAttribute("success", "Logout realizado com sucesso!");
        }
        //retorna o jsp
        return "index";
    }

    
    @GetMapping("/profile/{id}")
    public String profile(@PathVariable("id") Long id, ModelMap model) {        
        User user = userService.getUserData(id);        
        model.addAttribute("user", getContextUser());//yes are the same
        model.addAttribute("model", user);
        return path + "view";
    }
    
}
