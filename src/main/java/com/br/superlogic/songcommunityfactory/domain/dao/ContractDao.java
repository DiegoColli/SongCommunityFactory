package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Contract;

/**
 *
 * @author Diego
 */
public interface ContractDao {

    Contract get(Long id);

    void save(Contract model) throws RuntimeException;

    void delete(Long id) throws RuntimeException;

    void delete(Contract model) throws RuntimeException;

}
