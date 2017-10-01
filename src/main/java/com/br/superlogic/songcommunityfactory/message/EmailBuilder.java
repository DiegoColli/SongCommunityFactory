
package com.br.superlogic.songcommunityfactory.message;

import com.br.superlogic.songcommunityfactory.domain.model.Email;

/**
 *
 * @author Diego
 */
public interface EmailBuilder {
    
    public String getInviteTemplate(Email Email);
    
    public String getAlertTemplate(Email Email);
    
    public String getPasswordTemplate(Email Email, String password);
}
