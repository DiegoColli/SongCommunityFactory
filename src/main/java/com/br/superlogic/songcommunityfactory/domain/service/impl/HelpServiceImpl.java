package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.dao.ContractDao;
import com.br.superlogic.songcommunityfactory.domain.dao.FriendshipDao;
import com.br.superlogic.songcommunityfactory.domain.dao.HelpDao;
import com.br.superlogic.songcommunityfactory.domain.dao.HelpResponseDao;
import com.br.superlogic.songcommunityfactory.domain.dao.UserDao;
import com.br.superlogic.songcommunityfactory.domain.model.Contract;
import com.br.superlogic.songcommunityfactory.domain.model.Friendship;
import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.Style;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.service.HelpService;
import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diego
 */
@Service("helpService")
@Transactional
public class HelpServiceImpl implements HelpService {

    @Autowired
    @Qualifier("helpDao")
    private HelpDao dao;

    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    @Autowired
    @Qualifier("helpResponseDao")
    private HelpResponseDao responseDao;

    @Autowired
    @Qualifier("contractDao")
    private ContractDao contractDao;

    @Autowired
    @Qualifier("friendshipDao")
    private FriendshipDao friendshipDao;

    @Override
    public List<Help> listMyHelpRequests(User user) {
        List<Help> helps = dao.listUserHelpRequests(user);
        helps.forEach((help) -> {
            Hibernate.initialize(help.getResponses());
        });
        return helps;
    }

    @Override
    public List<HelpResponse> listMyAnswersAnswered(User user) {
        List<HelpResponse> responses = dao.listMyAnswersAnswered(user);
        responses.forEach((response) -> {
            Hibernate.initialize(response.getHelp());
        });
        return responses;
    }

    @Override
    public List<Help> listOthersHelpReqWithoutMyHelp(User _user, Integer interval) {
        User user = userDao.get(_user.getId());

        boolean showAll = false;
        for (Style style : user.getStyles()) {
            if (style.getId() == 4) {
                showAll = true;
            }
        }

        return dao.listOthersHelpReqWithoutMyHelp(user, interval, showAll);
    }

    @Override
    public void saveResponse(HelpResponse helpResp) {
        try {
            //if doesnt have a preview HelpResponse, this method will throw an excption
            //because HelpResponse allows just one reponse
            HelpResponse prev = responseDao.get(helpResp.getResponder(), helpResp.getHelp());
            helpResp.setId(prev.getId());
        } catch (NoResultException nre) {
        }
        //here update or insert
        responseDao.save(helpResp);
    }

    @Override
    public void delete(Help help) {
        help = dao.get(help.getId());
        responseDao.delete(help.getResponses());
        dao.delete(help);
    }

    @Override
    public void save(Help help) {
        dao.save(help);
    }

    @Override
    public HelpResponse getResponse(User user, Long idResponse) {
        return responseDao.get(user, idResponse);
    }

    @Override
    public HelpResponse getResponse(Long idResponse) {
        HelpResponse response =  responseDao.get(idResponse);
        Hibernate.initialize(response.getHelp());
        Hibernate.initialize(response.getHelp().getProject());
        Hibernate.initialize(response.getHelp().getRequester());
        return response;
    }

    @Override
    public void accept(User user, Long id) {
        HelpResponse helpResp = responseDao.get(user, id);
        helpResp.setStatus(1);//accept
        responseDao.save(helpResp);
        //create contract
        Contract contract = new Contract();
        contract.setProject(helpResp.getHelp().getProject());
        contract.setWorker(helpResp.getResponder());
        contractDao.save(contract);
        //create friendship        
        try {
            //if doesnt have a preview friendship, this method will throw an excption
            friendshipDao.get(helpResp.getHelp().getRequester(), helpResp.getResponder());
        } catch (NoResultException nre) {
            Friendship friendship = new Friendship();
            friendship.setRequester(helpResp.getHelp().getRequester());
            friendship.setRequested(helpResp.getResponder());
            friendship.setStatus(1);
            friendshipDao.save(friendship);
        }

    }

    @Override
    public void refuse(User user, Long id) {
        HelpResponse helpResp = responseDao.get(user, id);
        helpResp.setStatus(2);
        responseDao.save(helpResp);
    }

    @Override
    public void setRead(User user, Long id) {
        HelpResponse helpResp = responseDao.get(user, id);
        helpResp.setRead(1);
        responseDao.save(helpResp);
    }

    @Override
    public void update(HelpResponse helpResponse) {
        responseDao.save(helpResponse);
    }

}
