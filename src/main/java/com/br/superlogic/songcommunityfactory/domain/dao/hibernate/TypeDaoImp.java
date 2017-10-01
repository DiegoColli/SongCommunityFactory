
package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.TypeDao;
import com.br.superlogic.songcommunityfactory.domain.model.Type;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("typeDao")
public class TypeDaoImp extends AbstractDao<Long, Type> implements TypeDao{
    
    @Override
    public Type get(Long id)
    {
        return super.getByKey(id);
    }

    @Override
    public List<Type> list()
    {
        return this.listAll();
    }
        
}
