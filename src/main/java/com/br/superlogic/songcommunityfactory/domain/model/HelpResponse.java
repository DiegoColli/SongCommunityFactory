package com.br.superlogic.songcommunityfactory.domain.model;

import javax.persistence.CascadeType;
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
@Table(name = "help_response")
public class HelpResponse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 0 nothing 1 accept 2 refused
     */
    @Column(name = "status")
    private Integer status;

    @Column(name = "_read")//more or less like boolean
    private Integer read;

    /**
     * 0 no, 1 yes
     */
    @Column(name = "invite")
    private Boolean notified;

    @Column(length = 200, nullable = false)
    private String message;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_help", referencedColumnName = "id", nullable = false)
    private Help help;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "id_responder", referencedColumnName = "id", nullable = false)
    private User responder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Help getHelp() {
        return help;
    }

    public void setHelp(Help help) {
        this.help = help;
    }

    public User getResponder() {
        return responder;
    }

    public void setResponder(User responder) {
        this.responder = responder;
    }

    public Integer getRead() {
        return read;
    }

    public void setRead(Integer read) {
        this.read = read;
    }

    public Boolean getNotified() {
          if(notified == null)
            notified = false;
        return notified;
    }

    public void setNotified(Boolean notified) {
          if(notified == null)
            notified = false;
        this.notified = notified;
    }

}
