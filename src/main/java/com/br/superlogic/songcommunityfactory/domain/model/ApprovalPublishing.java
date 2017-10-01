package com.br.superlogic.songcommunityfactory.domain.model;

import java.io.Serializable;
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
@Table(name = "aproval_publishing")
public class ApprovalPublishing implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 300)
    @NotBlank
    private String description;

    @Column
    private LocalDateTime created;

    @Column
    private LocalDateTime deadLine;
    
    /**
     * 0 no, 1 yes
     */
    @Column(name = "_close")
    private Boolean close;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id", nullable = false)
    private Project project;

    @ManyToOne()
    @JoinColumn(name = "id_requester", referencedColumnName = "id", nullable = false)
    private User requester;
    
    @OneToMany(mappedBy = "approval", cascade = CascadeType.PERSIST)
    private List<ApprovalPublishingVote> votes;

    @OneToOne()
    @JoinColumn(name = "id_publishing")
    private Publishing publishing;
        
    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public LocalDateTime getCreated()
    {
        return created;
    }

    public void setCreated(LocalDateTime created)
    {
        this.created = created;
    }

    public LocalDateTime getDeadLine()
    {
        return deadLine;
    }

    public void setDeadLine(LocalDateTime deadLine)
    {
        this.deadLine = deadLine;
    }

    public Boolean getClose()
    {
        return close;
    }

    public void setClose(Boolean close)
    {
        this.close = close;
    }

    public List<ApprovalPublishingVote> getVotes()
    {
        return votes;
    }

    public void setVotes(List<ApprovalPublishingVote> votes)
    {
        this.votes = votes;
        
        if (this.votes != null)
        {
            this.votes.forEach((vote) ->
            {
                vote.setApproval(this);
            });
        }        
    }

    public Project getProject()
    {
        return project;
    }

    public void setProject(Project project)
    {
        this.project = project;
    }

    public User getRequester()
    {
        return requester;
    }

    public void setRequester(User requester)
    {
        this.requester = requester;
    }

    public Publishing getPublishing()
    {
        return publishing;
    }

    public void setPublishing(Publishing publishing)
    {
        this.publishing = publishing;
    }

   
    public boolean isApproved()
    {
        for (ApprovalPublishingVote foo : getVotes())
        {
            if(foo.getStatus() == 2 || foo.getStatus() == 0)
                return false;
        }
        
        return true;
    }

    public boolean isDisapproved()
    {
        for (ApprovalPublishingVote foo : getVotes())
        {
            if(foo.getStatus() == 2)
                return true;
        }

        return false;
    }

}
