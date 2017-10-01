package com.br.superlogic.songcommunityfactory.domain.model;

import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author Diego
 */
@Entity
@Table(name = "contract", uniqueConstraints={@UniqueConstraint(columnNames = {"id_user", "id_project"})})
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "id_user", referencedColumnName = "id", nullable = false)
    private User worker;

    @ManyToOne()
    @JoinColumn(name = "id_project", referencedColumnName = "id", nullable = false)
    private Project project;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getWorker() {
        return worker;
    }

    public void setWorker(User worker) {
        this.worker = worker;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + Objects.hashCode(this.id);
        hash = 71 * hash + Objects.hashCode(this.worker);
        hash = 71 * hash + Objects.hashCode(this.project);
        return hash;
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

        final Contract other = (Contract) obj;
        if (Objects.equals(this.worker, other.worker) && Objects.equals(this.project, other.project)) {
            return true;
        }

        if (!Objects.equals(this.id, other.id)) {
            return false;
        }

        return true;
    }

}
