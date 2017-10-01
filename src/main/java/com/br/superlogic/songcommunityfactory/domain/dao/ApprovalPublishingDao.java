
package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ApprovalPublishingDao
{
    List<ApprovalPublishing> listOpen(Project project);    

    public void save(ApprovalPublishing approval);

    public ApprovalPublishing get(Long id);

    public List<ApprovalPublishing> listOpen(User user);
}
