package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.util.SummaryProject;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface SummaryProjectDao {

    List<SummaryProject> list(User user);
}
