package com.br.superlogic.songcommunityfactory.domain.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "user")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private LocalDateTime created;

    @NotBlank(message = "Preencha o nome")
    @Column(length = 50, unique = true)
    private String username;

    @Email
    @NotBlank(message = "Preencha o email")
    @Column(length = 200, unique = true)
    private String email;

    @NotBlank(message = "Preencha a senha")
//    dont know why but this allways are throwable
//    @Min(message = "A senha deve possuir mais de seis caracters", value = 5)    

    @Column(length = 200)
    private String password;

    @Transient
    private String confirmPassword;

    @Column(name = "enabled", nullable = true)
    private boolean enabled;

    @Column(name = "status", nullable = true)
    private Integer status;

    @OneToMany(mappedBy = "worker")
    private List<Contract> contracts;

    @OneToMany(mappedBy = "owner")
    private List<Project> projects;

    @OneToMany(mappedBy = "owner")
    private List<Workspace> workspaces;

    @ManyToMany(cascade = {CascadeType.DETACH})
    @JoinTable(name = "user_style", joinColumns = {
        @JoinColumn(name = "id_user")}, inverseJoinColumns = {
        @JoinColumn(name = "id_style")})
    private List<Style> styles;
  
    @ManyToMany(mappedBy = "users")
    private List<Notification> notifications;

    @OneToMany(mappedBy = "user")
    private List<UserLogin> userLogin;

    @OneToMany(mappedBy = "user")
    private List<UserResource> resources;

    @OneToMany(mappedBy = "requester")
    private List<Help> helps;

    @OneToMany(mappedBy = "requester")
    private List<Friendship> requesterFriends;

    @OneToMany(mappedBy = "requested")
    private List<Friendship> requestedFriends;
    
    @OneToMany(mappedBy = "to")
    private List<SystemMessage> systemMessages;

    @Transient
    private Boolean cryptPassword;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();

        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // we never lock accounts
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // credentials never expire
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    public List<UserLogin> getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(List<UserLogin> userLogin) {
        this.userLogin = userLogin;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<UserResource> getResources() {
        return resources;
    }

    public void setResources(List<UserResource> resources) {
        this.resources = resources;
    }

    public List<Help> getHelps() {
        return helps;
    }

    public void setHelps(List<Help> helps) {
        this.helps = helps;
    }

    public List<Style> getStyles() {
        return styles;
    }

    public void setStyles(List<Style> styles) {
        this.styles = styles;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public boolean isSamePassword() {
        return this.password.equals(this.confirmPassword);
    }

    public Boolean isCryptPassword() {
        return cryptPassword;
    }

    public void setCryptPassword(Boolean cryptPassword) {
        this.cryptPassword = cryptPassword;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public List<Friendship> getRequesterFriends() {
        return requesterFriends;
    }

    public void setRequesterFriends(List<Friendship> requesterFriends) {
        this.requesterFriends = requesterFriends;
    }

    public List<Friendship> getRequestedFriends() {
        return requestedFriends;
    }

    public void setRequestedFriends(List<Friendship> requestedFriends) {
        this.requestedFriends = requestedFriends;
    }

    public List<Friendship> getFriends() {
        List<Friendship> newList = new ArrayList<>(requestedFriends);
        newList.addAll(requesterFriends);
        return newList;
    }

    public List<Friendship> getFriendsActive() {
        List<Friendship> newList = new ArrayList();
        getFriends().stream().filter((friend) -> (friend.getStatus() == 1)).forEachOrdered((friend) -> {
            newList.add(friend);
        });
        return newList;
    }

    public List<Friendship> getFriendsInactive() {
        List<Friendship> newList = new ArrayList();
        getFriends().stream().filter((friend) -> (friend.getStatus() == 0)).forEachOrdered((friend) -> {
            newList.add(friend);
        });
        return newList;
    }

    public List<Workspace> getWorkspaces() {
        return workspaces;
    }

    public void setWorkspaces(List<Workspace> workspaces) {
        this.workspaces = workspaces;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public String getCreatedBr() {
        return created.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.id);
        return hash;
    }

    public List<SystemMessage> getSystemMessages()
    {
        return systemMessages;
    }

    public void setSystemMessages(List<SystemMessage> systemMessages)
    {
        this.systemMessages = systemMessages;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }

}
