package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface FriendshipDao {

    public void save(List<Friendship> friendships);

    public void save(Friendship friendship);

    public Friendship get(User requester, User responder);

    
}
