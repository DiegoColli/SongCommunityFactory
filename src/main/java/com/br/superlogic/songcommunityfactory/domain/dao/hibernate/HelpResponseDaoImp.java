package com.br.superlogic.songcommunityfactory.domain.dao.hibernate;

import com.br.superlogic.songcommunityfactory.domain.dao.HelpResponseDao;
import com.br.superlogic.songcommunityfactory.domain.model.Help;
import com.br.superlogic.songcommunityfactory.domain.model.HelpResponse;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.Predicate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Diego
 */
@Repository("helpResponseDao")
public class HelpResponseDaoImp extends AbstractDao<Long, HelpResponse> implements HelpResponseDao {

    @Override
    public void save(HelpResponse model) {

        if (model.getId() != null && model.getId() > 0) {
            super.merge(model);
        } else {
            super.persist(model);
        }
    }

    @Override
    public HelpResponse get(User responder, Help help) {

        HelpResponse response;

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("responder"), responder)
        );
        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("help"), help)
        );

        response = this.getByPredicates(predicates);

        return response;
    }

    @Override
    public HelpResponse get(User user, Long idResponse) {
        HelpResponse response;

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(
                getCriteriaBuilder().equal(getRoot().get("id"), idResponse)
        );

        response = this.getByPredicates(predicates);

        return response;
    }

    @Override
    public void delete(List<HelpResponse> responses) {
        responses.forEach((response) -> {
            super.delete(response);
        });
    }

    @Override
    public HelpResponse get(Long idResponse) {
        return super.getByKey(idResponse);
    }

}
