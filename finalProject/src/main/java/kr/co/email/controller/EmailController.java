package kr.co.email.controller;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Random;

import javax.mail.Transport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.member.controller.EmailSender;
import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.MailVO;
import kr.co.member.model.vo.Member;



@Controller
class EmailController {

	@Autowired
	@Qualifier(value="emailSender")
	private EmailSender emailSender;
	
	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	
	@RequestMapping(value = "/sendMail.do")
	@ResponseBody
	public String sendMail(@RequestParam String emailaddr) throws Exception{
		
		MailVO email = new MailVO();
		System.out.println(emailaddr);
        String subject = "[결혼해JUO] 이메일 인증";
         	
     	Random rnd = new Random();
     	
     	String randomStr = String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));

     	for(int i=0;i<5;i++) {
     		randomStr=randomStr+String.valueOf((char) ((int) (rnd.nextInt(26)) + 97));
     		//랜덤문자열6개생성
     	}
     	
     	String emailContent = "<table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' bgcolor='#f5f5f5' style='border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;'>"+
		"<tbody><tr><td align='center' valign='top' bgcolor='#f5f5f5' style='background-color:#f5f5f5;border-collapse:collapse'>"+
		"<table border='0' width='600' cellpadding='0' cellspacing='0' style='width:600px;max-width:600px;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0'>"+
		"<tbody><tr><td style='border-collapse: collapse;display:block;margin-top:50px;width:20%'>"+
		"<a href='http://localhost/'><img src='http://localhost/resources/img/logo.png' border='0' style='width:80px;padding-bottom:18px;'></a></td></tr>"+
		"<tr><td style='padding:35px 30px 24px;background-color:#fff;border-collapse:collapse'>"+ 
		"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:13px;font-weight:bold;color:#444'>이메일 인증 코드</div>"+ 
		"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:20px;line-height:24px;text-align:left;color:#000;margin-top:12px;font-weight:bold;letter-spacing:1px;'><strong>"+ 
		randomStr+"</strong></div>"+ 
		"<div style='height:1px;border-bottom:1px solid #e0e0e0;margin-top:20px'>&nbsp;</div></td></tr>"+
		"<tr><td style='padding:0 30px 35px;background-color:#fff;border-collapse:collapse'>"+
		"<div style='font-family:dotum, NanumGothic, Helvetica, Arial,  sans-serif; font-size: 13px; line-height: 20px; text-align: left; color:#808080;  margin:0px 0 10px'>"+ 
		"반가워요! 결혼해JUO입니다. <br> 대한민국 No.1 웨딩 플랫폼 결혼해JUO에 함께 해주셔서 감사합니다.</div></td></tr>"+
		"<tr><td style='font-family: Helvetica, Arial, sans-serif;font-size: 12px;line-height: 18px;color: #aaa;border-collapse: collapse; padding: 15px 0 50px'>"+ 
		"© 2019 결혼해JUO<br>대한민국 결혼문화를 바꾸는 기업, <strong>결혼해JUO</strong><br></td></tr></tbody></table>" +
		"</td></tr></tbody></table>";		
     	
     	//email.setContents(randomStr);
     	email.setContents(emailContent);
     	email.setSubject(subject);
     	email.setTo(emailaddr);
     	email.setFrom("ccomekdj@gmail.com");
         
         emailSender.SendEmail(email);
       
          
         return randomStr;
	}
	
	
	
	/* 웨딩계산기 내역 이메일 전송 */
	@ResponseBody
	@RequestMapping(value="/simulatorEmail.do")
	public String simulatorEmail(@RequestParam String emailAddr, @RequestParam String num, @RequestParam String price, @RequestParam String finishDate) throws Exception{
		MailVO email = new MailVO();
		System.out.println("이메일 : "+emailAddr);
		
		//금액 콤마 찍기
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		String title = "[결혼해JUO] 웨딩계산기 견적 결과";
		
		//String emailContent = "<a href='http://localhost/simulator/simulator.jsp'>이도오옹</a>";
		/*String emailContent = "<div style='width:640px;margin:0 auto;background:#f5f5f5;padding:30px;text-align:center;'>"+
		"<h1 style='margin-bottom:20px;'><img src='http://localhost/resources/img/logo.png' style='width:50px;'></h1>"+
		"</div>";*/
		
		String emailContent = "<table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' bgcolor='#f5f5f5' style='border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;'>"+
		"<tbody><tr><td align='center' valign='top' bgcolor='#f5f5f5' style='background-color:#f5f5f5;border-collapse:collapse'>"+
		"<table border='0' width='600' cellpadding='0' cellspacing='0' style='width:600px;max-width:600px;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0'>"+
		"<tbody><tr><td style='border-collapse: collapse;display:block;margin-top:50px;width:20%'>"+
		"<a href='http://localhost/'><img src='http://localhost/resources/img/logo.png' border='0' style='width:80px;padding-bottom:18px;'></a></td></tr>"+
		"<tr><td style='padding:35px 30px 24px;background-color:#fff;border-collapse:collapse'>"+ 
		"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:18px;font-weight:bold;color:#444'>아래의 버튼을 눌러 견적상세페이지로 가보세요</div>"+ 
		"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:13px;line-height:20px;text-align:left;color:#818181;margin-top:12px;'>"+ 
		"반가워요! 결혼해JUO입니다. <br> 대한민국 No.1 웨딩 플랫폼 결혼해JUO에 함께 해주셔서 감사합니다.</div>"+ 
		"<div style='height:1px;border-bottom:1px solid #e0e0e0;margin-top:20px'>&nbsp;</div></td></tr>"+
		"<tr><td style='padding:0 30px 35px;background-color:#fff;border-collapse:collapse'><div style='font-family:dotum, NanumGothic, Helvetica, Arial,  sans-serif; font-size: 13px; line-height: 20px; text-align: left; color:#808080;  margin:0px 0 10px'>"+ 
		"견적일시: "+finishDate+"<br>견적금액: "+formatter.format(Integer.parseInt(price))+"원<br></div>"+
		"<div style='margin:0px 0 0px; text-align:center;'>" + 
		"<a href='http://localhost/simulatorEmailCheck.do?no="+Integer.parseInt(num)+"' style='background-color:#faaca8;border: none;color:white;padding: 8px 30px;text-align: center;text-decoration: none;font-size: 14px;display: inline-block;' target='_blank'>견적 상세보기</a>" + 
		"</div></td></tr>"+
		"<tr><td style='font-family: Helvetica, Arial, sans-serif;font-size: 12px;line-height: 18px;color: #aaa;border-collapse: collapse; padding: 15px 0 50px'>"+ 
		"© 2019 결혼해JUO<br>대한민국 결혼문화를 바꾸는 기업, <strong>결혼해JUO</strong><br></td></tr></tbody></table>" +
		"</td></tr></tbody></table>";		
		email.setSubject(title);
		email.setContents(emailContent);
		email.setTo(emailAddr);
		email.setFrom("ccomekdj@gmail.com");
		
		emailSender.SendEmail(email);
		
		return title;
	}
	
	
	public void sendPw() {
		
	}
	
	@RequestMapping(value = "/sendPw.do")
	public String sendPw(@RequestParam String memberId,@RequestParam String email,Model model) throws Exception {
		System.out.println("비밀번호찾기 호출");
		System.out.println(memberId+email+"emailControll");
		Member m = memberService.searchPw(memberId,email);
		String view="";
		if(m==null) {
			model.addAttribute("msg", "확인되는 아이디가없습니다");
			model.addAttribute("loc", "loginPage.do");
			view = "common/msg";
		}else {	
			MailVO vo = new MailVO();
			System.out.println("이메일 : "+email);
			
	     	String emailContent = "<table border='0' width='100%' height='100%' cellpadding='0' cellspacing='0' bgcolor='#f5f5f5' style='border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;'>"+
	     			"<tbody><tr><td align='center' valign='top' bgcolor='#f5f5f5' style='background-color:#f5f5f5;border-collapse:collapse'>"+
	     			"<table border='0' width='600' cellpadding='0' cellspacing='0' style='width:600px;max-width:600px;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0'>"+
	     			"<tbody><tr><td style='border-collapse: collapse;display:block;margin-top:50px;width:20%'>"+
	     			"<a href='http://localhost/'><img src='http://localhost/resources/img/logo.png' border='0' style='width:80px;padding-bottom:18px;'></a></td></tr>"+
	     			"<tr><td style='padding:35px 30px 24px;background-color:#fff;border-collapse:collapse'>"+ 
	     			"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:13px;font-weight:bold;color:#444'>이메일 인증 코드</div>"+ 
	     			"<div style='font-family:dotum, NanumGothic, Helvetica, Arial, sans-serif;font-size:20px;line-height:24px;text-align:left;color:#000;margin-top:12px;font-weight:bold;letter-spacing:1px;'><strong>"+ 
	     			m.getMemberPw()+"</strong></div>"+ 
	     			"<div style='height:1px;border-bottom:1px solid #e0e0e0;margin-top:20px'>&nbsp;</div></td></tr>"+
	     			"<tr><td style='padding:0 30px 35px;background-color:#fff;border-collapse:collapse'>"+
	     			"<div style='font-family:dotum, NanumGothic, Helvetica, Arial,  sans-serif; font-size: 13px; line-height: 20px; text-align: left; color:#808080;  margin:0px 0 10px'>"+ 
	     			"반가워요! 결혼해JUO입니다. <br> 대한민국 No.1 웨딩 플랫폼 결혼해JUO에 함께 해주셔서 감사합니다.</div></td></tr>"+
	     			"<tr><td style='font-family: Helvetica, Arial, sans-serif;font-size: 12px;line-height: 18px;color: #aaa;border-collapse: collapse; padding: 15px 0 50px'>"+ 
	     			"© 2019 결혼해JUO<br>대한민국 결혼문화를 바꾸는 기업, <strong>결혼해JUO</strong><br></td></tr></tbody></table>" +
	     			"</td></tr></tbody></table>";		
	     	     	
	     	     	//email.setContents(randomStr);
	     	     	vo.setContents(emailContent);
	     	     	vo.setSubject("비밀번호입니다");
	     	     	vo.setTo(email);
	     	     	vo.setFrom("ccomekdj@gmail.com");
	     	         
	     	         emailSender.SendEmail(vo);
		
					model.addAttribute("msg", "메일이 발송되었습니다");
					model.addAttribute("loc", "findPw.do");
					view = "common/msg";
		}
		
		
		return view;
	}
}
