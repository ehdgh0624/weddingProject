package kr.co.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/login.do")
	public String memberLogin(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw) {
		System.out.println("로그인 호출");
		Member memberSet = new Member();
		memberSet.setMemberId(memberId);
		memberSet.setMemberPw(memberPw);
		Member member = memberService.selectOneMember(memberSet);
		HttpSession session = request.getSession(); 		
		String view = "";
		
		if(member!=null) {
			session.setAttribute("member", member);
			view = "member/loginSuccess";
		}else {
			view = "member/loginFailed";
		}
		return view;
	}
	
	@RequestMapping(value = "/loginPage.do")
	public String memberLogin() {
		System.out.println("로그인 호출");
	
		return "member/loginPage";
	}

}
