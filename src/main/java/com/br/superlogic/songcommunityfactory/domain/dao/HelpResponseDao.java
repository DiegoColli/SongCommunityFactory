package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface HelpResponseDao {
    
    public void save(HelpResponse response);

    public HelpResponse get(User responder, Help help);

    public HelpResponse get(User user, Long idResponse);
    
    public HelpResponse get(Long idResponse);

    public void delete(List<HelpResponse> responses);
    
}
