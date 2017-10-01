
package com.br.superlogic.songcommunityfactory.domain.dao;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspace;
import com.br.superlogic.songcommunityfactory.domain.model.Project;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.util.List;

/**
 *
 * @author Diego
 */
public interface ApprovalWorkspaceDao
{
    List<ApprovalWorkspace> listOpen(Project project);    

    public void save(ApprovalWorkspace approval);

    public ApprovalWorkspace get(Long id);

    public List<ApprovalWorkspace> listOpen(User user);
}
