package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "workspace")
public class Workspace
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 50, nullable = false)
    @NotBlank
    private String name;

    @Column()
    private Double version;

    @Column
    private Boolean principal;

    @Column
    private Boolean blocked;

    @Column(length = 400)
    @NotBlank
    private String description;

    @OneToMany(mappedBy = "workspace")
    private List<ProjectResource> resources;
    
    @OneToMany(mappedBy = "workspace", cascade = CascadeType.REMOVE)
    private List<ApprovalWorkspace> approvals;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id", nullable = false)
    private Project project;

    @ManyToOne()
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    private User owner;

    @OneToOne
    @JoinColumn(name = "base")
    private Workspace base;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public List<ProjectResource> getResources()
    {
        return resources;
    }

    public void setResources(List<ProjectResource> resources)
    {
        this.resources = resources;
    }

    public Project getProject()
    {
        return project;
    }

    public void setProject(Project project)
    {
        this.project = project;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public Boolean getPrincipal()
    {
        if (principal == null)
        {
            principal = false;
        }

        return principal;
    }

    public void setPrincipal(Boolean principal)
    {
        if (principal == null)
        {
            principal = false;
        }

        this.principal = principal;
    }

    public User getOwner()
    {
        return owner;
    }

    public void setOwner(User owner)
    {
        this.owner = owner;
    }

    public Double getVersion()
    {
        return version;
    }

    public void setVersion(Double version)
    {
        this.version = version;
    }

    public Workspace getBase()
    {
        return base;
    }

    public void setBase(Workspace base)
    {
        this.base = base;
    }

    public Boolean getBlocked()
    {
        return blocked;
    }

    public void setBlocked(Boolean blocked)
    {
        this.blocked = blocked;
    }

    public List<ApprovalWorkspace> getApprovals()
    {
        return approvals;
    }

    public void setApprovals(List<ApprovalWorkspace> approvals)
    {
        this.approvals = approvals;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 53 * hash + Objects.hashCode(this.name);
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
        final Workspace other = (Workspace) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        return true;
    }

}
