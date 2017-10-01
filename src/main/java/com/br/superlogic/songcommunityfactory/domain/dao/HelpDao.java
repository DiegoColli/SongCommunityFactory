package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface HelpDao {
    
    List<Help> listUserHelpRequests(User user);
    
    List<Help> listOthersHelpReqWithoutMyHelp(User user, Integer interval, boolean showAll);

    public void delete(Help help);

    public void save(Help help);

    public List<HelpResponse> listMyAnswersAnswered(User user);

    public Help get(Long id);
    
}
