package com.br.superlogic.songcommunityfactory.domain.model;

import com.br.superlogic.songcommunityfactory.configuration.AppConfig;
import com.br.superlogic.songcommunityfactory.domain.model._interface.Resource;
import com.br.superlogic.songcommunityfactory.domain.model.util.ResourceType;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "project_resource")
public class ProjectResource implements Resource, Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100)
    private String name;

    @ManyToOne()
    @JoinColumn(name = "id_workspace", referencedColumnName = "id")
    private Workspace workspace;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id")
    private Project project;

    @OneToMany(mappedBy = "projectResource")
    private List<PublishingItem> publishings;

    @Transient
    private String path;

    @Transient
    private byte[] bytes;

    @Transient
    private User user;

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
        return name;
    }

    public void setName(String Name)
    {
        this.name = Name;
    }

    @Override
    public String getPath()
    {
        if (path != null)
        {
            return path;
        }
        path = AppConfig.getPropertiy("path.uploads") + "projects/" + getProject().getId() + "/" + getWorkspace().getId();
        path += "/" + getId() + getExt();
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
        path = "/uploads/projects/" + getProject().getId() + "/" + getWorkspace().getId();
        path += "/" + getId() + getExt();
        return path;
    }

    @Override
    public String getType()
    {
        return ResourceType.getType(this);
    }

    public void setPath(String path)
    {
        this.path = path;
    }

    public Workspace getWorkspace()
    {
        return workspace;
    }

    public void setWorkspace(Workspace workspace)
    {
        this.workspace = workspace;
    }

    public Project getProject()
    {
        return project;
    }

    public void setProject(Project project)
    {
        this.project = project;
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

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public List<PublishingItem> getPublishings()
    {
        return publishings;
    }

    public void setPublishings(List<PublishingItem> publishings)
    {
        this.publishings = publishings;
    }

}
