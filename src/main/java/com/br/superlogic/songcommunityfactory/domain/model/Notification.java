package com.br.superlogic.songcommunityfactory.domain.model;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
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

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "notification")
public class Notification implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 300, nullable = false)
    private String title;

    /**
     * 0 info, 1 success, 2 default, 3 warning, 4 danger
     */
    @Column(name = "_level")
    private Integer level;

    /**
     * 0 no, 1 yes
     */
    @Column(name = "_open")
    private Boolean open;

    /**
     * 0 no, 1 yes
     */
    @Column(name = "invite")
    private Boolean invite;

    /**
     * 0 no, 1 yes
     */
    @Column(name = "link_project")
    private Boolean projLink;

    @OneToMany(mappedBy = "notification", cascade = CascadeType.PERSIST)
    private List<Message> messages;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id")
    private Project project;

    @ManyToOne()
    @JoinColumn(name = "id_created_by", referencedColumnName = "id")
    private User createdBy;

    @ManyToMany(cascade = {CascadeType.DETACH})
    @JoinTable(name = "user_notification", joinColumns = {
        @JoinColumn(name = "id_notification")}, inverseJoinColumns = {
        @JoinColumn(name = "id_user")})
    private List<User> users;

    @Transient
    private List<Email> emails;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        if (title != null) {
            if (title.length() > 299) {
                title = title.substring(0, 299);
            }
        }

        this.title = title;
    }

    public List<Message> getMessages() {
        return messages == null ? Collections.EMPTY_LIST : messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;

        if (this.messages != null) {
            this.messages.forEach((message) -> {
                message.setNotification(this);
            });
        }
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<Email> getEmails() {
        return emails == null ? Collections.EMPTY_LIST : emails;
    }

    public void setEmails(List<Email> emails) {
        this.emails = emails;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public boolean isInvite() {
        if (invite == null) {
            invite = false;
        }
        return invite;
    }

    public void setInvite(Boolean invite) {
        if (invite == null) {
            invite = false;
        }
        this.invite = invite;
    }

    public boolean isProjLink() {
        if (projLink == null) {
            projLink = false;
        }
        return projLink;
    }

    public void setProjLink(Boolean projLink) {
        if (projLink == null) {
            projLink = false;
        }
        this.projLink = projLink;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        if (open == null) {
            open = false;
        }
        this.open = open;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
