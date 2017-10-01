
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalWorkspaceVote;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import com.br.superlogic.songcommunityfactory.domain.model.Workspace;

/**
 *
 * @author Diego
 */
public interface ApprovalWorkspaceService
{
    public void submitWorkspace(Workspace workspace, String description);

    public void vote(ApprovalWorkspaceVote vote);

    public void update(User user);
}
