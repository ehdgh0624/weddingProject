package kr.co.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.service.AdminService;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	@Qualifier(value="adminService")
	AdminService adminService;
	
	@RequestMapping(value="/adminPage.do")
	public String adminPage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		if(m != null) {
			if(m.getMemberId().equals("admin")) {
				return "admin/adminPage";
			}else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/TestDj.jsp";
			}
		}else {
			System.out.println("알수없는 접근자가 접근했습니다.");
			return "redirect:/";
		}
	}
}
