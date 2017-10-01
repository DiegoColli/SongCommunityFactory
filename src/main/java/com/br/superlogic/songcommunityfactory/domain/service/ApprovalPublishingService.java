
package com.br.superlogic.songcommunityfactory.domain.service;

import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishing;
import com.br.superlogic.songcommunityfactory.domain.model.ApprovalPublishingVote;
import com.br.superlogic.songcommunityfactory.domain.model.User;
import java.io.IOException;

/**
 *
 * @author Diego
 */
public interface ApprovalPublishingService
{
    public void submitPublishing(ApprovalPublishing publishing) throws IOException;

    public void vote(ApprovalPublishingVote vote) throws IOException;

    public ApprovalPublishing getComplete(Long id);

    public void update(User user)throws IOException;
}
