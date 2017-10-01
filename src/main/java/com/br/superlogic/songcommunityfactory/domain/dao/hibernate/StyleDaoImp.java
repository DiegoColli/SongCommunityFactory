
package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.StyleDao;
import com.br.superlogic.songcommunityfactory.domain.model.Style;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("styleDao")
public class StyleDaoImp extends AbstractDao<Long, Style> implements StyleDao{
    
    @Override
    public Style get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public List<Style> list()
    {
        return this.listAll();
    }

}
