package com.br.superlogic.songcommunityfactory.domain.model;

import com.br.superlogic.songcommunityfactory.configuration.AppConfig;
import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import com.br.superlogic.songcommunityfactory.domain.model.util.ResourceType;
import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "resource")
public class PublicResource implements Resource, Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100)
    private String Name;

    @Column(name = "_path")
    private String path;

    @Transient
    private byte[] bytes;

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
    public String getName()
    {
        return Name;
    }

    public void setName(String Name)
    {
        this.Name = Name;
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
    public int hashCode()
    {
        int hash = 7;
        hash = 19 * hash + Objects.hashCode(this.id);
        hash = 19 * hash + Objects.hashCode(this.Name);
        hash = 19 * hash + Objects.hashCode(this.path);
        return hash;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (this == obj)
        {
            return true;
        }
        if (obj == null)
        {
            return false;
        }
        if (getClass() != obj.getClass())
        {
            return false;
        }
        final PublicResource other = (PublicResource) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        return true;
    }

    @Override
    public String getExt()
    {
        return getName().substring(getName().lastIndexOf("."), getName().length());
    }

    @Override
    public String getAppPath()
    {
        String foo = path.replace(AppConfig.getPropertiy("path.uploads"), "");
        
        return "/uploads/"+foo;        
    }

    @Override
    public String getType()
    {
        return ResourceType.getType(this);
    }
}
