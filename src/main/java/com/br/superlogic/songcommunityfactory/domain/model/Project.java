package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "project")
public class Project
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 50, nullable = false)
    @NotBlank
    private String name;

    @Column(length = 50)
    private String bandName;

    @Column(length = 400)
    @NotBlank
    private String description;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    private User owner;

    @ManyToMany(cascade ={CascadeType.DETACH})
    @JoinTable(name = "project_type", joinColumns ={@JoinColumn(name = "id_project")}, inverseJoinColumns ={@JoinColumn(name = "id_type")})
    private List<Type> types;

    @ManyToMany(cascade ={CascadeType.DETACH})
    @JoinTable(name = "project_style", joinColumns ={@JoinColumn(name = "id_project")}, inverseJoinColumns ={@JoinColumn(name = "id_style")})
    private List<Style> styles;

    @OneToMany(mappedBy = "project", cascade = CascadeType.PERSIST)
    private List<Workspace> workspaces;

    @OneToMany(mappedBy = "project", cascade = CascadeType.PERSIST)
    private List<Help> helps;

    @OneToMany(mappedBy = "project", cascade = CascadeType.PERSIST)
    private List<Notification> notifications;

    @OneToMany(mappedBy = "project", cascade = CascadeType.PERSIST)
    private List<ProjectHistory> history;

    @OneToMany(mappedBy = "project", cascade = CascadeType.PERSIST)
    private List<ProjectResource> resources;

    @OneToMany(mappedBy = "project")
    private List<Contract> contracts;

    @OneToMany(mappedBy = "project")
    private List<Publishing> publishings;
            
    @OneToMany(mappedBy = "project")
    private List<ApprovalPublishing> approvalPublishings;
    
    @OneToMany(mappedBy = "project")
    private List<ApprovalWorkspace> approvalWorkspaces;

    @Transient
    private List<Email> emails;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public List<Email> getEmails()
    {
        return emails == null ? Collections.EMPTY_LIST : emails;
    }

    public void setEmails(List<Email> emails)
    {
        this.emails = emails;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public User getOwner()
    {
        return owner;
    }

    public void setOwner(User owner)
    {
        this.owner = owner;
    }

    public List<Workspace> getWorkspaces()
    {
        return workspaces == null ? Collections.EMPTY_LIST : workspaces;
    }

    public void setWorkspaces(List<Workspace> workspaces)
    {
        this.workspaces = workspaces;

        if (this.workspaces != null)
        {
            this.workspaces.forEach((wk) ->
            {
                wk.setProject(this);
            });
        }
    }

    public List<Contract> getContracts()
    {
        return contracts == null ? Collections.EMPTY_LIST : contracts;
    }

    public void setContracts(List<Contract> contracts)
    {
        this.contracts = contracts;

        if (this.contracts != null)
        {
            this.contracts.forEach((contract) ->
            {
                contract.setProject(this);
            });
        }
    }

    public List<ProjectResource> getResources()
    {
        return resources == null ? Collections.EMPTY_LIST : resources;
    }

    public void setResources(List<ProjectResource> resources)
    {
        this.resources = resources;

        if (this.resources != null)
        {
            this.resources.forEach((resource) ->
            {
                resource.setProject(this);
            });
        }
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public List<Type> getTypes()
    {
        return types == null ? Collections.EMPTY_LIST : types;
    }

    public void setTypes(List<Type> types)
    {
        this.types = types;
    }

    public List<Style> getStyles()
    {
        return styles == null ? Collections.EMPTY_LIST : styles;
    }

    public void setStyles(List<Style> styles)
    {
        this.styles = styles;
    }

    public List<Help> getHelps()
    {
        return helps == null ? Collections.EMPTY_LIST : helps;
    }

    public void setHelps(List<Help> helps)
    {
        this.helps = helps;

        if (this.helps != null)
        {
            this.helps.forEach((help) ->
            {
                help.setProject(this);
            });
        }
    }

    public List<ProjectHistory> getHistory()
    {
        return history;
    }

    public void setHistory(List<ProjectHistory> history)
    {
        this.history = history;
    }

    public void addHistory(ProjectHistory _history)
    {
        if (history == null)
        {
            history = new ArrayList<>();
        }
        history.add(_history);
    }

    public List<Notification> getNotifications()
    {
        return notifications == null ? Collections.EMPTY_LIST : notifications;
    }

    public void setNotifications(List<Notification> notifications)
    {
        this.notifications = notifications;

        if (this.notifications != null)
        {
            this.notifications.forEach((notification) ->
            {
                notification.setProject(this);
            });
        }
    }

    public void addEmail(Email email)
    {
        if (emails == null)
        {
            emails = new ArrayList<>();
        }
        emails.add(email);
    }

    public List<Publishing> getPublishings()
    {
        return publishings;
    }

    public void setPublishings(List<Publishing> publishings)
    {
        this.publishings = publishings;
    }

    public String getBandName()
    {
        return bandName;
    }

    public void setBandName(String bandName)
    {
        this.bandName = bandName;
    }

    public List<ApprovalPublishing> getApprovalPublishings()
    {
        return approvalPublishings;
    }

    public void setApprovalPublishings(List<ApprovalPublishing> approvalPublishings)
    {
        this.approvalPublishings = approvalPublishings;
    }

    public List<ApprovalWorkspace> getApprovalWorkspaces()
    {
        return approvalWorkspaces;
    }

    public void setApprovalWorkspaces(List<ApprovalWorkspace> approvalWorkspaces)
    {
        this.approvalWorkspaces = approvalWorkspaces;
    }
        
    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.id);
        hash = 47 * hash + Objects.hashCode(this.name);
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
        final Project other = (Project) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        return true;
    }

}
