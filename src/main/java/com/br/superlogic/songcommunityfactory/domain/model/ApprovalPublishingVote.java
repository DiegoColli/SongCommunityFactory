package com.br.superlogic.songcommunityfactory.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "aproval_publishing_vote")
public class ApprovalPublishingVote
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 0 nothing 1 accept 2 refused
     */
    @Column(name = "status")
    private Integer status;

    @ManyToOne()
    @JoinColumn(name = "id_approval", referencedColumnName = "id", nullable = false)
    private ApprovalPublishing approval;

    @ManyToOne()
    @JoinColumn(name = "id_user", referencedColumnName = "id", nullable = false)
    private User user;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public ApprovalPublishing getApproval()
    {
        return approval;
    }

    public void setApproval(ApprovalPublishing approval)
    {
        this.approval = approval;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

}
