package com.br.superlogic.songcommunityfactory.api.rest.controller;

import com.br.superlogic.songcommunityfactory.domain.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author Diego
 */
public abstract class SimpleRestController
{

    protected User getContextUser()
    {
        return (User) getAuthentication().getPrincipal();
    }

    protected Authentication getAuthentication()
    {
        return SecurityContextHolder.getContext().getAuthentication();
    }
}
