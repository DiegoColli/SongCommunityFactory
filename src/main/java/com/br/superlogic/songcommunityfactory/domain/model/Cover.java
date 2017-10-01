package com.br.superlogic.songcommunityfactory.domain.model;

import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import com.br.superlogic.songcommunityfactory.domain.model.util.ResourceType;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "cover")
public class Cover implements Resource, Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "_path")
    private String path;

    @Transient
    private byte[] bytes;

    @Transient
    private String name;

    @OneToOne()
    @JoinColumn(name = "id_publishing")
    private Publishing publishing;

    @Override
    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    @Override
    public String getPath()
    {
        return path;
    }

    public void setPath(String path)
    {
        this.path = path;
    }

    @Override
    public byte[] getBytes()
    {
        return bytes;
    }

    public void setBytes(byte[] bytes)
    {
        this.bytes = bytes;
    }

    public Publishing getPublishing()
    {
        return publishing;
    }

    public void setPublishing(Publishing publishing)
    {
        this.publishing = publishing;
    }
    
    @Override
    public String getName()
    {
        if(name != null)
            return name;
        
        return getPath().substring(getPath().lastIndexOf("/")+1, getPath().length());
        
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @Override
    public String getExt()
    {
        return getName().substring(getName().lastIndexOf("."), getName().length());
    }

    @Override
    public String getAppPath()
    {
        path = "/uploads/publishing/"+publishing.getId()+"/"+getName();
        return path;        
    }

    @Override
    public String getType()
    {
        return ResourceType.getType(this);
    }
}
