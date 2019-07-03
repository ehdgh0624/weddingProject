package kr.co.admin.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.service.AdminService;
import kr.co.admin.vo.AdminMember;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	@Qualifier(value="adminService")
	AdminService adminService;
	
	@RequestMapping(value="/adminPage.do")
	public String adminPage(HttpServletRequest request,HttpSession session,Model model) {
		session = request.getSession(false);
		System.out.println(session);
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				AdminMember list = adminService.memberAll(reqPage);
				model.addAttribute("list", list);
				
				return "admin/adminPage";
			}else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}
	
}
