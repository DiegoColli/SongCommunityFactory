package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.FriendshipDao;
import com.br.superlogic.songcommunityfactory.domain.dao.UserDao;
import com.br.superlogic.songcommunityfactory.domain.model.Email;
import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.UserDetailsServiceScf;
import com.br.superlogic.songcommunityfactory.message.EmailBuilder;
import java.security.SecureRandom;
import java.util.List;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("userDetailsService")
@Transactional
public class UserDetailsServiceImpl implements UserDetailsServiceScf {
    
    @Autowired
    EmailBuilder emailBuilder;

    @Autowired
    @Qualifier("emailService")
    private EmailServiceImpl emailService;
    
    @Autowired
    @Qualifier("userDao")
    private UserDao dao;
    
    @Autowired
    @Qualifier("friendshipDao")
    private FriendshipDao friendshipDao;

    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
        User user = dao.getByName(string);
        if (user == null) {
            throw new UsernameNotFoundException("Usuário não encontrado");
        }
        return user;
    }

    @Override
    public User getUserData(User _user) {
        User user = dao.get(_user.getId());
        Hibernate.initialize(user.getProjects());
        Hibernate.initialize(user.getContracts());
        Hibernate.initialize(user.getStyles());
        Hibernate.initialize(user.getFriends());
        return user;
    }

    @Override
    public User insert(User user) 
    {     
        if(dao.alreadyExistsName(user.getUsername()))
        {
            throw new IllegalArgumentException("Nome de Usuário já existente! Por favor escolha um outro nome.");
        }
        else{
            dao.save(user);
            return user;
        }
    }

    @Override
    public void update(User user) 
    {        
        if(dao.alreadyExistsName(user.getUsername(), user.getId()))
        {
            throw new IllegalArgumentException("Nome de Usuário já existente! Por favor escolha um outro nome.");
        }
        else{
            dao.save(user);            
        }        
    }

    @Override
    public void updateFriendships(List<Friendship> friendships) {
        friendshipDao.save(friendships);
    }

    @Override
    public User getUserData(Long id) {
        User user = dao.get(id);
        Hibernate.initialize(user.getProjects());
        Hibernate.initialize(user.getContracts());
        Hibernate.initialize(user.getStyles());
        Hibernate.initialize(user.getFriends());
        return user;
    }

    @Override
    public void generatePassword(String email)
    {
        try
        {
            User user = dao.getByEmail(email);            
            int size = user.getUsername().length()+6;
            char[] possibleCharacters = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?").toCharArray();
            String randomStr = RandomStringUtils.random(size, 0, possibleCharacters.length-1, false, false, possibleCharacters, new SecureRandom());
            user.setPassword(randomStr);
            user.setCryptPassword(Boolean.TRUE);
            dao.save(user);
            sendEmail(user, randomStr);
        }
        catch (Exception e)
        {
            throw new IllegalArgumentException("Endereço de e-mail não localizado!");
        }        
    }
    
    
    private void sendEmail(User user, String password){
        Email email = new Email();
        email.setFrom(user.getEmail());
        email.setTo(user.getEmail());
        email.setStatus(0);
        email.setSubject("Solicitação de Nova Senha SongCommunityFactory");
        email.setBody(emailBuilder.getPasswordTemplate(email, password));
        
        emailService.sendEmail(email);
    }

}
