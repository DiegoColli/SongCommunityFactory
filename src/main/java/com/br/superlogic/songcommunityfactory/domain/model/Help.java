package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "help")
public class Help {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 1000, nullable = false)
    private String message;

    @ManyToOne()
    @JoinColumn(name = "id_requester", referencedColumnName = "id", nullable = false)
    private User requester;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_project", referencedColumnName = "id")
    private Project project;

    @OneToMany(mappedBy = "help")
    private List<HelpResponse> responses;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getRequester() {
        return requester;
    }

    public void setRequester(User requester) {
        this.requester = requester;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<HelpResponse> getResponses() {
        return responses;
    }
    
    public List<HelpResponse> getResponsesAccepted() {
        List<HelpResponse> newList = new ArrayList();
        getResponses().stream().filter((response) -> (response.getStatus() == 1)).forEachOrdered((response) -> {
            newList.add(response);
        });
        return newList;
    }
    
    public List<HelpResponse> getResponsesRefused() {
        List<HelpResponse> newList = new ArrayList();
        getResponses().stream().filter((response) -> (response.getStatus() == 2)).forEachOrdered((response) -> {
            newList.add(response);
        });
        return newList;
    }
    
    public List<HelpResponse> getResponsesUnread() {
        List<HelpResponse> newList = new ArrayList();
        getResponses().stream().filter((response) -> (response.getStatus() == 0)).forEachOrdered((response) -> {
            newList.add(response);
        });
        return newList;
    }
    

    public void setResponses(List<HelpResponse> responses) {
        this.responses = responses;
    }

}
