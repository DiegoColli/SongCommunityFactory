package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.HelpDao;
import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("helpDao")
public class HelpDaoImp extends AbstractDao<Long, Help> implements HelpDao {

    @Override
    public List<Help> listUserHelpRequests(User user) {

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("requester"), user)
        );

        return this.listByPredicates(predicates);
    }

    @Override
    public List<Help> listOthersHelpReqWithoutMyHelp(User user, Integer interval, boolean showAll) {
        return this.getSession().createNativeQuery(listOthersHelpReqWithoutMyHelpSql(user, interval, showAll), Help.class).getResultList();
    }

    private String listOthersHelpReqWithoutMyHelpSql(User user, Integer interval, boolean showAll) {

        String sql = "SELECT DISTINCT H.* FROM help H\n"
                + "INNER JOIN project P ON H.id_project = P.id\n"
                + "INNER JOIN project_style PS ON P.id = PS.id_project\n"
                + "WHERE  ";
                if(!showAll)//just match styles
                {
                    sql += "( PS.id_style IN  (SELECT US.id_style FROM user_style US WHERE US.id_user = " + user.getId() + ")\n"
                        + " OR PS.id_style = 4 ) AND \n";                
                }                    
                sql +=  " P.id NOT IN \n"
                + "(SELECT id FROM project WHERE project.id_user = " + user.getId() + ")\n"
                + "AND H.id NOT IN\n" 
                + "(SELECT id_help FROM help_response WHERE id_responder = " + user.getId() + ")\n"
                + "AND P.id IN\n" 
                +"(SELECT PH.id_project FROM project_history PH \n"
                + "WHERE PH.type = 1 AND PH.created >= DATE(NOW()) - INTERVAL "+interval+" DAY)";
                
        return sql;

    }

    @Override
    public void delete(Help help) {
        super.delete(help);
    }

    @Override
    public void save(Help model) {
        if (model.getId() != null && model.getId() > 0) {
            super.merge(model);
        } else {
            super.persist(model);
        }
    }

    @Override
    public List<HelpResponse> listMyAnswersAnswered(User user) {
        return this.getSession().createNativeQuery(listMyAnswersAnsweredSql(user), HelpResponse.class).getResultList();
    }

    private String listMyAnswersAnsweredSql(User user) {
        String sql = "SELECT DISTINCT * FROM help_response WHERE \n" +
                      "id_responder = " + user.getId() + " AND _read IS null";
        return sql;
    }

    @Override
    public Help get(Long id) {
        return super.getByKey(id);
    }

}
