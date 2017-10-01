package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.Collections;
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

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "message")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 300)
    private String phrase;

    @OneToMany(mappedBy = "message", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private List<UserMessageStatus> userMessageStatus;

    @ManyToOne()
    @JoinColumn(name = "id_from", referencedColumnName = "id")
    private User from;

    @ManyToOne()
    @JoinColumn(name = "id_notification", referencedColumnName = "id", nullable = false)
    private Notification notification;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhrase() {
        return phrase;
    }

    public void setPhrase(String phrase) {
        this.phrase = phrase;
    }

    public User getFrom() {
        return from;
    }

    public void setFrom(User from) {
        this.from = from;
    }

    public Notification getNotification() {
        return notification;
    }

    public void setNotification(Notification notification) {
        this.notification = notification;
    }

    public List<UserMessageStatus> getUserMessageStatus() {
        return userMessageStatus == null ? Collections.EMPTY_LIST : userMessageStatus;        
    }

    public void setUserMessageStatus(List<UserMessageStatus> userMessageStatus) {
        this.userMessageStatus = userMessageStatus;
        if (this.userMessageStatus != null) {
            this.userMessageStatus.forEach((message) -> {
                message.setMessage(this);
            });
        }
    }
}
