package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.StyleDao;
import com.br.superlogic.songcommunityfactory.domain.model.Style;
import com.br.superlogic.songcommunityfactory.domain.service.StyleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("styleService")
@Transactional
public class StyleServiceImpl implements StyleService{

    @Autowired
    @Qualifier("styleDao")
    private StyleDao dao;

    @Override
    public List<Style> list() {
        return dao.list();
    }

}
