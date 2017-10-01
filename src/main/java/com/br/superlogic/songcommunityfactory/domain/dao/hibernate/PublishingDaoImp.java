package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.Publishing;
import com.br.superlogic.songcommunityfactory.domain.dao.PublishingDao;
import com.br.superlogic.songcommunityfactory.domain.model.util.SearchPublishing;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("publishingDao")
public class PublishingDaoImp extends AbstractDao<Long, Publishing> implements PublishingDao {

    @Override
    public Publishing get(Long id) {
        return super.getByKey(id);
    }

    @Override
    public void save(Publishing model) throws RuntimeException {
        if(model.getId()!= null && model.getId()>0)
            super.merge(model);
        else
            super.persist(model);
    }

    @Override
    public List<Publishing> listBy(SearchPublishing search)
    {
       return this.getSession().createNativeQuery(getSql(search), Publishing.class).getResultList();
    }

    private String getSql(SearchPublishing search)
    {
        String sql = "SELECT * FROM publishing WHERE approved = 1";
        
        if(search != null)
        {
            if(!search.getBandName().trim().equals(""))
            {
                sql+= " AND id_project IN (SELECT id FROM project WHERE bandName LIKE '%"+search.getBandName()+"%' ) ";
            }
            if(!search.getProjectName().trim().equals(""))
            {
                sql+= " AND id_project IN (SELECT id FROM project WHERE name LIKE '%"+search.getProjectName()+"%' ) ";
            }
            if(!search.getMusicName().trim().equals(""))
            {
                sql+= " AND id IN ( SELECT id_publishing FROM publishing_item WHERE title LIKE '%"+search.getMusicName()+"%') ";
            }
            if(search.getStyles()!=null && search.getStyles().size() > 0)
            {
                boolean notAll = true;
                String tempIds = "";
                for (String style : search.getStyles())
                {
                    if("4".equals(style))//4 = all
                        notAll = false;
                    
                    tempIds += style+",";
                }
                
                String ids = tempIds.substring (0, tempIds.length() - 1);
                
                if(notAll)
                    sql+= " AND id_style IN ("+ids+") ";
            }
        }
        
        sql+= " LIMIT 50 ";
        
        System.out.println(sql);

        
        return sql;
    }

}
