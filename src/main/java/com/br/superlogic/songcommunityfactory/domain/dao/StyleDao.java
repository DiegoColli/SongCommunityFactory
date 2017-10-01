package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Style;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface StyleDao {

    Style get(Long id);

    List<Style> list();
}
