package com.br.superlogic.songcommunityfactory.domain.model.util;

import java.util.Collections;
import java.util.List;

/**
 *
 * @author Diego
 */
public class SearchPublishing
{

    private String bandName;
    
    private String projectName;
    
    private String musicName;
    
    private List<String> styles;

    public String getBandName()
    {
        return bandName;
    }

    public void setBandName(String bandName)
    {
        this.bandName = bandName;
    }

    public String getProjectName()
    {
        return projectName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getMusicName()
    {
        return musicName;
    }

    public void setMusicName(String musicName)
    {
        this.musicName = musicName;
    }

    public List<String> getStyles()
    {
        return styles == null ? Collections.EMPTY_LIST : styles;                
    }

    public void setStyles(List<String> styles)
    {
        this.styles = styles;
    }  

}
