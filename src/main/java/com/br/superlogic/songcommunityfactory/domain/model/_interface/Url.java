/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.superlogic.songcommunityfactory.domain.model._interface;

import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author Diego
 */
public interface Url {

    public Long getId();

    public void setId(Long id);

    public String getUrl();

    public void setUrl(String url);

    public String getProtocol();

    public void setProtocol(String protocol);

    public String getDomain();

    public void setDomain(String domain);

    public String getPort();

    public void setPort(String port);

    public String getPath();

    public void setPath(String path);

    public String getQuery();

    public void setQuery(String query);

    public Url setAllByURL() throws MalformedURLException;

    public Url setAllByURL(String url) throws MalformedURLException;

}
