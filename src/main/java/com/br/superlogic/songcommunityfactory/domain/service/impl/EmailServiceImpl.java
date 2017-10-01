package com.br.superlogic.songcommunityfactory.domain.service.impl;

import com.br.superlogic.songcommunityfactory.domain.model.Email;
import com.br.superlogic.songcommunityfactory.domain.service.EmailService;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 *
 * @author Diego
 */
@Service("emailService")
public class EmailServiceImpl implements EmailService {

    @Autowired
    JavaMailSender mailSender;

    @Override
    public void sendEmail(Email mail) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        try {
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
            
            mimeMessageHelper.setFrom(mail.getFrom());
            mimeMessageHelper.setTo(mail.getTo());
            
            if(mail.getCc()!=null)
                mimeMessageHelper.setCc(mail.getCc());
            if(mail.getBcc()!=null)
                mimeMessageHelper.setBcc(mail.getBcc());
            
            mimeMessageHelper.setSubject(mail.getSubject());
            mimeMessageHelper.setText(mail.getBody(), true);
            
            mailSender.send(mimeMessageHelper.getMimeMessage());
        } catch (MessagingException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    
    public void sendEail(List<Email> mails)
    {
        mails.forEach((mail) ->
        {
            sendEmail(mail);
        });
    }

}