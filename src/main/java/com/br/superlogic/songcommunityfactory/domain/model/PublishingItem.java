package com.br.superlogic.songcommunityfactory.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "publishing_item")
public class PublishingItem
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 50, nullable = false)
    @NotBlank
    private String title;

    @Column
    private Long downloaded;

    @ManyToOne()
    @JoinColumn(name = "id_publishing", referencedColumnName = "id")
    private Publishing publishing;

    @ManyToOne()
    @JoinColumn(name = "id_project_resource", referencedColumnName = "id")
    private ProjectResource projectResource;

    @ManyToOne()
    @JoinColumn(name = "id_public_resource", referencedColumnName = "id")
    private PublicResource publicResource;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public Long getDownloaded()
    {
        return downloaded;
    }

    public void setDownloaded(Long downloaded)
    {
        this.downloaded = downloaded;
    }

    public Publishing getPublishing()
    {
        return publishing;
    }

    public void setPublishing(Publishing publishing)
    {
        this.publishing = publishing;
    }

    public ProjectResource getProjectResource()
    {
        return projectResource;
    }

    public void setProjectResource(ProjectResource projectResource)
    {
        this.projectResource = projectResource;
    }

    public PublicResource getPublicResource()
    {
        return publicResource;
    }

    public void setPublicResource(PublicResource publicResource)
    {
        this.publicResource = publicResource;
    }

}
