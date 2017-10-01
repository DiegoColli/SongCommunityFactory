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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "user_resource")
public class UserResource implements Resource, Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100)
    private String Name;

    @Column(name = "_path")
    private String path;

    @ManyToOne()
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    private User user;

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

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
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

    @Override
    public String getExt()
    {
        return getName().substring(getName().lastIndexOf("."), getName().length());
    }

    @Override
    public String getAppPath()
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public String getType()
    {
        return ResourceType.getType(this);
    }
}
