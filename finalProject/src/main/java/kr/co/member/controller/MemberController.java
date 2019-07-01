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
			System.out.println("로그인성공");
			view = "member/loginSuccess";
		}else {
			view = "member/loginFailed";
			System.out.println("로그인실패");
		}
		return view;
	}
	
	@RequestMapping(value = "/loginPage.do")
	public String memberLogin() {
		System.out.println("로그인페이지 호출");
	
		return "member/loginPage";
	}
	@RequestMapping(value = "/enrollPage.do")
	public String enrollPage() {
		System.out.println("회원가입페이지 호출");
		return "member/enrollPage";
	}
	
	
	
	@RequestMapping(value = "/memberEnroll.do")
	public String memberEnroll(Member vo) {
		int result = memberService.insertMember(vo);
		
		
		
		
		if(result>0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
		
	
		
	}

}
