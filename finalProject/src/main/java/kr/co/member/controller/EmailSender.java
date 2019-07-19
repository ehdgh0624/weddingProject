package kr.co.member.controller;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import kr.co.member.model.vo.MailVO;

@Component
public class EmailSender  {
     
    @Autowired
    protected JavaMailSender  mailSender;
 
    public void SendEmail(MailVO email) throws Exception {
         
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setHeader("content-type", "text/html; charset=utf-8");
        msg.setSubject(email.getSubject());
        msg.setText(email.getContents(), "UTF-8", "html");
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getTo()));
        mailSender.send(msg); 
    }
}
