package com.br.superlogic.songcommunityfactory.message;

import com.br.superlogic.songcommunityfactory.domain.model.Email;
import com.br.superlogic.songcommunityfactory.domain.service.impl.EmailServiceImpl;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

/**
 *
 * @author Diego
 */
@Service("emailBuilder")
@PropertySource(value = {"classpath:application.properties"})
public class EmailBuilderImpl implements EmailBuilder{

    @Autowired
    private Environment environment;
    
    @Autowired
    VelocityEngine velocityEngine;

    @Override
    public String getInviteTemplate(Email Email) {
        StringBuilder content = new StringBuilder();           
        try {
            content.append(
                VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, environment.getRequiredProperty("template.invite"), Email.toMap()
            ));
        } 
        catch (VelocityException e) {
            Logger.getLogger(EmailServiceImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return content.toString();
    }

    @Override
    public String getAlertTemplate(Email Email) {
        StringBuilder content = new StringBuilder();        
        try {
            content.append(
                VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, environment.getRequiredProperty("template.alert"), Email.toMap()
            ));
        } 
        catch (VelocityException e) {
            Logger.getLogger(EmailServiceImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return content.toString();
    }

    @Override
    public String getPasswordTemplate(Email Email, String password)
    {
        StringBuilder content = new StringBuilder();        
        Map<String, Object> map = Email.toMap();
        map.put("password", password);
        
        try {
            content.append(
                VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, environment.getRequiredProperty("template.password"), map
            ));
        } 
        catch (VelocityException e) {
            Logger.getLogger(EmailServiceImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        return content.toString();
    }

}
