package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.model.Contract;
import com.br.superlogic.songcommunityfactory.domain.dao.ContractDao;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("contractDao")
public class ContractDaoImp extends AbstractDao<Long, Contract> implements ContractDao {

    @Override
    public Contract get(Long id) {
        return super.getByKey(id);
    }

    @Override
    public void save(Contract model) throws RuntimeException {
        super.persist(model);
    }

    @Override
    public void delete(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Contract model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
