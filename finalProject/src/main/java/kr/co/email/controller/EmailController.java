package kr.co.email.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.member.controller.EmailSender;
import kr.co.member.model.vo.MailVO;



@Controller
class EmailController {

	@Autowired
	@Qualifier(value="emailSender")
	private EmailSender emailSender;
	@RequestMapping(value = "/sendMail.do")
	@ResponseBody
	public String sendMail(@RequestParam String emailaddr) throws Exception{
		
		MailVO email = new MailVO();
		System.out.println(emailaddr);
         String subject = "이메일인증입니다";
         	
         	Random rnd = new Random();
         	
         	String randomStr = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));

         	for(int i=0;i<5;i++) {
         		randomStr=randomStr+String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
         		//랜덤문자열6개생성
         	}
         	
         	email.setContents(randomStr);
         	email.setSubject(subject);
         	email.setTo(emailaddr);
         	email.setFrom("ccomekdj@gmail.com");
         
         emailSender.SendEmail(email);
       
          
         return randomStr;
	}
	
}
