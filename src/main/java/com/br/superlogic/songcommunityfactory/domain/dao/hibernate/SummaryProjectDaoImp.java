package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.SummaryProjectDao;
import com.br.superlogic.songcommunityfactory.domain.model.util.SummaryProject;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("summaryProjectDao")
public class SummaryProjectDaoImp extends AbstractDao<Long, SummaryProject> implements SummaryProjectDao {

    @Override
    public List<SummaryProject> list(User user) {
        List<SummaryProject> list = new ArrayList<>();
        List<Object[]> resultList = this.getSession().createNativeQuery(getSql(user)).getResultList();

        for (Object[] obj : resultList) {
            SummaryProject sum = new SummaryProject();
            sum.setId((BigInteger) obj[0]);
            sum.setName((String) obj[1]);
            sum.setWorkspaces((BigInteger) obj[2]);
            sum.setContracts((BigInteger) obj[3]);
            sum.setResources((BigInteger) obj[4]);
            sum.setPublications((BigInteger) obj[5]);
            sum.setCreated((Timestamp) obj[6]);

            list.add(sum);
        }

        return list;
    }

    private String getSql(User user) {
        String sql = "SELECT project.id, project.name, \n"
                + "(SELECT COUNT(workspace.id) FROM workspace WHERE workspace.id_project = project.id) AS WK, \n"
                + "(SELECT COUNT(contract.id) FROM contract WHERE contract.id_project = project.id) AS CT, \n"
                + "(SELECT COUNT(project_resource.id) FROM project_resource WHERE project_resource.id_project = project.id) AS PR, \n"
                + "(SELECT COUNT(publishing.id) FROM publishing WHERE publishing.id_project = project.id) AS PU, \n"
                + "(SELECT MIN(project_history.created) FROM project_history WHERE project_history.id_project = project.id) AS DT \n"
                + "FROM project  \n"
                + "WHERE project.id_user = "+user.getId()+" OR project.id IN \n"
                + "(SELECT contract.id_project FROM contract WHERE contract.id_user = "+user.getId()+")";

        return sql;
    }

}
