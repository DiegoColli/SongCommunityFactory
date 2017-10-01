package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Diego
 */
public class Email {

    public String from;

    public String to;

    private String cc;

    private String bcc;

    private String subject;

    public String body;

    public Integer status;

    private String contentType;

    //email não deveria ter isso abaixo, e sim campos text1, text2... numa lista ou map 
    
    private Project project;
    
    private User user;

    public String userMessage;

    private List<Object> attachments;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContentType() {
        if (contentType == null) {
            contentType = "text/plain";
        }

        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getBcc() {
        return bcc;
    }

    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    public List<Object> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<Object> attachments) {
        this.attachments = attachments;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

    public Map<String, Object> toMap() {

        Map<String, Object> model = new HashMap<>();

        if (user != null) {
            model.put("userName", user.getUsername());
            model.put("userEmail", user.getEmail());
        }
        if (project != null) {
            model.put("projectName", project.getName());
        }
        model.put("userMessage", userMessage);
        model.put("from", from);
        model.put("to", to);

        return model;
    }

}
