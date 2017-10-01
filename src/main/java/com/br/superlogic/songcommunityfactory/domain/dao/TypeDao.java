
package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Type;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface TypeDao {
    
    Type get(Long id);

    List<Type> list();
}
