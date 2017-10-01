package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.dao.ProjectDao;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("projectDao")
public class ProjectDaoImp extends AbstractDao<Long, Project> implements ProjectDao {

    @Override
    public Project get(Long id) {
        return super.getByKey(id);
    }

    @Override
    public Project get(User user, Long id) {
        Project project;

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("owner"), user)
        );
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("id"), id)
        );

        try{
            project = this.getByPredicates(predicates);
        }
        catch(Exception e)//NoResultException
        {
            project = this.getSession().createNativeQuery(getSql(user, id), Project.class).getSingleResult();
        }

        return project;
    }

    @Override
    public void save(Project model) throws RuntimeException {
        if(model.getId()!= null && model.getId()>0)
            super.merge(model);
        else
            super.persist(model);
    }

    @Override
    public void delete(Project model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    @Override
    public List<Project> list(User user) {

        return this.getSession().createNativeQuery(listSql(user), Project.class).getResultList();
    }


    private String getSql(User user, Long id) {
        String sql="SELECT * FROM project\n" +
                    "WHERE project.id = "+id+" AND project.id IN \n" +
                    "(SELECT contract.id_project FROM contract WHERE id_user = "+user.getId()+" )";
        
        return sql;
    }
    
    
    private String listSql(User user) {
        String sql="SELECT * FROM project\n" +
                    "WHERE project.id_user = "+user.getId()+" OR project.id IN \n" +
                    "(SELECT contract.id_project FROM contract WHERE id_user = "+user.getId()+" )";
        
        return sql;
    }
    
}
