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
@Table(name = "systemMessage")
public class SystemMessage
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 500)
    private String message;

    /**
     * 0 info, 1 success, 2 default, 3 warning, 4 danger
     */
    @Column(name = "_level")
    private Integer level;

    @Column
    private Boolean readed;

    @ManyToOne()
    @JoinColumn(name = "id_to", referencedColumnName = "id")
    private User to;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public User getTo()
    {
        return to;
    }

    public void setTo(User to)
    {
        this.to = to;
    }

    public Integer getLevel()
    {
        return level;
    }

    public void setLevel(Integer level)
    {
        this.level = level;
    }

    public Boolean getReaded()
    {
        return readed;
    }

    public void setReaded(Boolean readed)
    {
        this.readed = readed;
    }

}
