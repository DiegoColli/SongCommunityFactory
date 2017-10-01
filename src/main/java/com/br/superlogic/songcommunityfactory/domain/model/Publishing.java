package com.br.superlogic.songcommunityfactory.domain.model;

import java.time.LocalDateTime;
import java.util.List;
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
@Table(name = "publishing")
public class Publishing
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 50, nullable = false)
    @NotBlank
    private String title;

    @Column(length = 400)
    @NotBlank
    private String description;

    @Column
    private LocalDateTime created;

    @Column
    private Boolean approved;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id")
    private Project project;

    @ManyToOne()
    @JoinColumn(name = "id_style", referencedColumnName = "id")
    private Style style;

    @OneToMany(mappedBy = "publishing", cascade = CascadeType.PERSIST)
    private List<PublishingItem> items;

    @OneToOne(mappedBy = "publishing")
    private ApprovalPublishing approval;

    @OneToOne(mappedBy = "publishing", cascade = CascadeType.PERSIST)
    private Cover cover;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Project getProject()
    {
        return project;
    }

    public void setProject(Project project)
    {
        this.project = project;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public List<PublishingItem> getItems()
    {
        return items;
    }

    public void setItems(List<PublishingItem> items)
    {
        this.items = items;
        
        if (this.items != null)
        {
            this.items.forEach((item) ->
            {
                item.setPublishing(this);
            });
        }        
    }

    public LocalDateTime getCreated()
    {
        return created;
    }

    public void setCreated(LocalDateTime created)
    {
        this.created = created;
    }

    public Style getStyle()
    {
        return style;
    }

    public void setStyle(Style style)
    {
        this.style = style;
    }

    public ApprovalPublishing getApproval()
    {
        return approval;
    }

    
    public Boolean getApproved()
    {
        return approved;
    }

    public void setApproval(ApprovalPublishing approval)
    {
        this.approval = approval;
    }

    public void setApproved(Boolean approved)
    {
        this.approved = approved;
    }

    public Cover getCover()
    {
        return cover;
    }

    public void setCover(Cover cover)
    {
        this.cover = cover;
        if (this.cover != null)
        {
            this.cover.setPublishing(this);
        }

    }
}
