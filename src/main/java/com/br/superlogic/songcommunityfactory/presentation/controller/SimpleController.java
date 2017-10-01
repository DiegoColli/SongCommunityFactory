package com.br.superlogic.songcommunityfactory.presentation.controller;

import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author Diego
 */
public abstract class SimpleController
{

    @Autowired
    @Qualifier("gsonWithNulls")
    protected Gson gson;

    protected User getContextUser()
    {
        return (User) getAuthentication().getPrincipal();
    }

    protected Authentication getAuthentication()
    {
        return SecurityContextHolder.getContext().getAuthentication();
    }

}
