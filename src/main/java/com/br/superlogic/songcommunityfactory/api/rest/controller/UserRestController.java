package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.UserDetailsServiceScf;
import com.br.superlogic.songcommunityfactory.message.SuccessMessage;
import java.time.LocalDateTime;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Diego
 */
@RestController
@RequestMapping("api/user")
public class UserRestController extends SimpleRestController {

    @Autowired
    @Qualifier("userDetailsService")
    private UserDetailsServiceScf service;

    @PostMapping(value = {"/joinUs", "/create"})
    public ResponseEntity<SuccessMessage> create(@Valid @RequestBody User user) throws Exception 
    {
        if (user.isSamePassword()) 
        {
            user.setCryptPassword(Boolean.TRUE);
            user.setEnabled(Boolean.TRUE);
            user.setCreated(LocalDateTime.now());
            service.insert(user);
        } 
        else 
        {
            throw new IllegalArgumentException("Senhas não conferem!");
        }

        return new ResponseEntity<>(new SuccessMessage("Usuário Criado com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping(value = {"/update/user"})
    public ResponseEntity<SuccessMessage> update(@RequestBody User user) throws Exception 
    {
        User userBefore = service.getUserData(getContextUser());        
        user.setEnabled(userBefore.isEnabled());        
        user.setCreated(userBefore.getCreated());
        
        if(user.getPassword()!= null && !"".equals(user.getPassword().trim()))
        {
            if (user.isSamePassword())
            {
                user.setCryptPassword(Boolean.TRUE);    
            }
            else 
            {
                throw new IllegalArgumentException("Senhas não conferem!");
            }    
        }
        else{
            user.setPassword(userBefore.getPassword());
            user.setCryptPassword(Boolean.FALSE);
        }
        
        
        service.update(user);

        return new ResponseEntity<>(new SuccessMessage("Usuário Alterado com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping(value = {"/friendship"})
    public ResponseEntity<SuccessMessage> manageFriendship(@RequestBody List<Friendship> friendships) throws Exception 
    {
        service.updateFriendships(friendships);
        return new ResponseEntity<>(new SuccessMessage("Amizades Alteradas com Sucesso!"), HttpStatus.OK);
    }

    @PostMapping(value = {"/forgotPassword"})
    public ResponseEntity<SuccessMessage> forgotPassword(@RequestParam(value = "email") String email) 
    {    
        service.generatePassword(email);
        return new ResponseEntity<>(new SuccessMessage("Solicitação de senha realizada com sucesso!"), HttpStatus.OK);
    }


}
