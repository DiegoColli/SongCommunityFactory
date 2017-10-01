package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author dacolli
 * @param <PK>
 * @param <T>
 */
public abstract class AbstractDao<PK extends Serializable, T> {

    public AbstractDao() {
        this.persistentClass = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    private final Class<T> persistentClass;

    @Autowired
    private SessionFactory sessionFactory;

    private CriteriaBuilder criteriaBuilder;
    
    private CriteriaQuery<T> criteriaQuery;
    
    private Root<T> root;
    
    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    protected CriteriaBuilder getCriteriaBuilder() {
        if(criteriaBuilder == null)
            criteriaBuilder = getSession().getCriteriaBuilder();
        return criteriaBuilder;
    }

    protected CriteriaQuery<T> getCriteriaQuery() {
        if(criteriaQuery == null)
            criteriaQuery = getCriteriaBuilder().createQuery(this.persistentClass);
        return criteriaQuery;
    }
    
    protected Root<T> getRoot() {
        if(root == null)
            root = getCriteriaQuery().from(this.persistentClass);
        return root;
    }
    
    protected Query getQuery(String query) {
        return getSession().createQuery(query);
    }

    protected Query getQuery(CriteriaQuery<T> criteriaQuery) {
        return getSession().createQuery(criteriaQuery);
    }


    //simple functions
    protected void persist(T entity) throws RuntimeException {
        this.getSession().persist(entity);
    }
    
    protected void merge(T entity) throws RuntimeException {
        this.getSession().merge(entity);
    }

    protected void delete(T entity) throws RuntimeException {
        this.getSession().delete(entity);
    }

    protected T getByKey(PK key) {
        return (T) getSession().get(this.persistentClass, key);
    }

    protected T getByColumn(String column, String value) {
        getCriteriaQuery().where(getCriteriaBuilder().equal(getRoot().get(column), value));
        Query query = getQuery(getCriteriaQuery());
        return (T) query.getSingleResult();
    }
    
    protected T getByPredicates(List<Predicate> predicates) {
        getCriteriaQuery().select(getRoot()).where(predicates.toArray(new Predicate[]{}));
        Query query = getQuery(getCriteriaQuery());
        return (T) query.getSingleResult();
    }

    protected List<T> listAll() {        
        getCriteriaQuery().select(getRoot());
        Query query = getQuery(getCriteriaQuery());
        return query.getResultList();
    }

    protected List<T> listByPredicates(List<Predicate> predicates) {        
        getCriteriaQuery().select(getRoot()).where(predicates.toArray(new Predicate[]{}));
        Query query = getQuery(getCriteriaQuery());
        return query.getResultList();
    }

}
