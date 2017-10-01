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
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "aproval_workspace")
public class ApprovalWorkspace implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 200)
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
    @JoinColumn(name = "id_workspace", referencedColumnName = "id", nullable = false)
    private Workspace workspace;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id", nullable = false)
    private Project project;

    @OneToMany(mappedBy = "approval", cascade = CascadeType.PERSIST)
    private List<ApprovalWorkspaceVote> votes;

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

    public List<ApprovalWorkspaceVote> getVotes()
    {
        return votes;
    }

    public void setVotes(List<ApprovalWorkspaceVote> votes)
    {
        this.votes = votes;
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

    public boolean isApproved()
    {
        Double total = (double) getVotes().size();
        Double trues = (double) 0;
        
        for (ApprovalWorkspaceVote foo : getVotes())
        {
            if(foo.getStatus() == 1)
                trues++;
        }
        
        if(ruleOfThree(trues, total) >= 50)
            return true;
        
        return false;
    }

    public boolean isDisapproved()
    {
        Double total = (double) getVotes().size();
        Double falses =(double) 0;
        
        for (ApprovalWorkspaceVote foo : getVotes())
        {
            if(foo.getStatus() == 2)
                falses++;
        }
        if(ruleOfThree(falses, total) > 50)
            return true;
        
        return false;
    }

    private Double ruleOfThree(Double val, Double total)
    {
        Double percent = (double) 0;
        if (val > 0)
        {
            val = val * 100;
            percent = val / total;
        }
        return percent;
    }
}
