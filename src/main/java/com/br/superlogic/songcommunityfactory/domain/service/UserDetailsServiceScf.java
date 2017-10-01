
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Diego
 */
public interface UserDetailsServiceScf extends UserDetailsService{
    
    
    User insert(User user);

    public User getUserData(User contextUser);

    public void update(User user);

    public void updateFriendships(List<Friendship> friendships);

    public User getUserData(Long id);
    
    public void generatePassword(String email);
}
