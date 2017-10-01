package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface HelpService {

    List<Help> listMyHelpRequests(User user);

    List<Help> listOthersHelpReqWithoutMyHelp(User user, Integer interval);

    List<HelpResponse> listMyAnswersAnswered(User user);

    public void saveResponse(HelpResponse helpResponse);

    public void delete(Help help);

    public void save(Help help);

    public HelpResponse getResponse(User user, Long idResponse);

    public HelpResponse getResponse(Long idResponse);

    public void accept(User user, Long id);

    public void refuse(User user, Long id);

    public void setRead(User user, Long id);

    public void update(HelpResponse helpResponse);

}
