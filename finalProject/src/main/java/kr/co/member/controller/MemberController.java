package kr.co.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberAll;



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
			System.out.println(member);
			System.out.println("로그인성공");
			return "redirect:/";
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
	
	@RequestMapping(value = "/memberUpdate.do")
	public String memberUpdate() {
		System.out.println("회원계정관리");
	
		return "member/memberUpdate";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null&&(Member)session.getAttribute("member")!=null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	

	@RequestMapping(value = "/enrollPage.do")
	public String enrollPage() {
		System.out.println("회원가입페이지 호출");
		return "member/enrollPage";
	}
	
	@RequestMapping(value = "/memberEnroll.do")
	public String memberEnroll(Member vo) {
		System.out.println("회원가입로직시작");
		
		System.out.println(vo);
		int result = memberService.insertMember(vo);
		if(result>0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
	}
	@RequestMapping(value = "/myCompanyPage.do")
	public String myCompanyView(HttpSession session,Model model) {
		System.out.println("나의업체 관리페이지");
		Member vo =(Member)session.getAttribute("member");	
		Studio ms = memberService.selectOneStudioMember(vo);
		Dress md = memberService.selectOneDressMember(vo);
		Hall mh = memberService.selectOneHallMember(vo);
		Makeup mm = memberService.selctOneMakeupMember(vo);	
		MemberAll ma = new MemberAll(md,ms,mm,mh);
		
		System.out.println(ms);
		System.out.println(md);
		System.out.println(mh);
		System.out.println(mm);
		
			
		model.addAttribute("memberAll",ma);
		
		return "member/myCompanyPage";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String myPageView(HttpSession session,Model model) {
		System.out.println("마이페이지 호출");
		
		Member vo =(Member)session.getAttribute("member");	
		model.addAttribute("member",vo);
		return "member/mypage";
	}
	//아직 적용안함
	@RequestMapping(value = "/addCompany.do")
	public String addCompany() {
		System.out.println("업체등록페이지 호출");

		return "member/addCompany";
	}
	
	@RequestMapping(value = "/companyEnroll.do")
	public String companyEnroll(CompanyInfo ci,HttpSession session) {
		System.out.println("업체등록 로직 시작");
		Member vo =(Member)session.getAttribute("member");	
		System.out.println(ci);
		int result=0;
		
		if(ci.getCode()==0) {
			result = memberService.insertStudio(ci,vo);
		}else if(ci.getCode()==1) {
			result = memberService.insertDress(ci,vo);
		}else if(ci.getCode()==2) {
			result = memberService.insertMakeup(ci,vo);
		}else if(ci.getCode()==3) {
			result = memberService.insertHall(ci,vo);
		}
		
		if(result>0) {
			System.out.println("등록성공");
			return "redirect:/index.jsp";
		}else {
			System.out.println("등록실패");
			return "redirect:/index.jsp";
		}
	}

}
