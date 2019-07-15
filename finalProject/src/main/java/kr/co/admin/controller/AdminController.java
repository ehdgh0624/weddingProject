package kr.co.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.admin.service.AdminService;
import kr.co.admin.vo.AdminCompany;
import kr.co.admin.vo.AdminGoods;
import kr.co.admin.vo.AdminMember;
import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	@Qualifier(value="adminService")
	AdminService adminService;
	
	@RequestMapping(value="/addGoodsPage.do")
	public String addGoodsPage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				
				return "/admin/addGoodsPage";
			}else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/goodsCare.do")
	public String goodsCarePage(HttpServletRequest request,Model model) {
		int code;
		int reqPage;
		try {
			code = Integer.parseInt(request.getParameter("code"));
		}catch(NumberFormatException e) {
			code = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		AdminGoods gList = adminService.getGList(reqPage,code);
		model.addAttribute("gList", gList);
		return "/admin/goodsCarePage";
	}
	
	@RequestMapping(value="/adminPage.do")
	public String adminPage(HttpServletRequest request,HttpSession session,Model model) {
		session = request.getSession(false);
		int reqPage;
		int ssCode;
		try {
			ssCode = Integer.parseInt(request.getParameter("sCode"));
		}catch(NumberFormatException e) {
			ssCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
			}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				AdminMember list = adminService.memberAll(reqPage,ssCode);
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
	@RequestMapping(value="/addGoods.do")
	public String addGoods(HttpServletRequest request,@RequestParam MultipartFile img,Goods g) {
		int result = 0;
		if(!img.isEmpty()) {
			SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmm");
			Date time = new Date();
			String time1= fomat.format(time);
			String savePath = request.getSession().getServletContext().getRealPath("/resources/img/goods/");
			String originName =img.getOriginalFilename();
			//img1.jsp 실제파일명과 확장자 분리
			String onlyFileName = originName.substring(0, originName.indexOf("."));//파일명
			String extension=originName.substring(originName.indexOf("."));//확장자명
			String filepath = onlyFileName+"_"+time1+extension; // 현재시간을 초단위까지 하면 파일명이 겹일일이 없다.
			String fullpath = savePath+"/"+filepath;
				try {
					byte[] bytes = img.getBytes();
					File f = new File(fullpath);
					FileOutputStream fos = new FileOutputStream(f);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					System.out.println("파일업로드성공");
					g.setGoodsFileName(originName); 
					g.setGoodsFilePath(filepath);
					result = adminService.addGoods(g);
						if(result>0) {
							bos.write(bytes);
							bos.close();
						}
					} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}else {
			result = adminService.addGoods(g);
		}
		if(result>0) {
			return "/admin/addGoodsPage";
		}else {
			return "/admin/addGoodsPage";
		}
	}
	@RequestMapping("/searchMember.do")
	public String searchMember(HttpServletRequest request,String type , String keyword ,Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				AdminMember list = adminService.memberSearch(reqPage,type,keyword);
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
	@RequestMapping(value="/companyManager.do")
	public String companyManager(HttpServletRequest request,Model model) {
		int reqPage;
		int typeCode;
		HttpSession session = request.getSession(false);
		try {
			typeCode = Integer.parseInt(request.getParameter("typeCode"));
		}catch(NumberFormatException e) {
			typeCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				AdminCompany ac = adminService.companySearch(reqPage, typeCode);
				model.addAttribute("ac",ac );
				return "admin/companyManagerPage";
			}else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
		
	}
	@RequestMapping(value="/agreeUpdate.do")
	public String agreeUpdate(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		String id = request.getParameter("id");
			if(session !=null&&(Member)session.getAttribute("member")!=null) {
				Member m = (Member)session.getAttribute("member");
					if(m.getMemberId().equals("admin")) {
						int result = adminService.agree(num,code,id);
						if(result >0) {
							String agree = "업체허가하였습니다.";
							String loc = "companyManager.do";
							model.addAttribute("msg", agree);
							model.addAttribute("loc", loc);
						}
						return "common/msg";
					}else {
						System.out.println("알수없는 접근자가 접근했습니다.");
						return "redirect:/";
				}
			}else {
				System.out.println("로그인후 사용가능");
				return "redirect:/";
			}	
	}
	@RequestMapping(value="/rejectUpdate.do")
	public String rejectUpdate(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		String id = request.getParameter("id");
			if(session !=null&&(Member)session.getAttribute("member")!=null) {
				Member m = (Member)session.getAttribute("member");
					if(m.getMemberId().equals("admin")) {
						int result = adminService.reject(num,code,id);
						if(result >0) {
							String agree = "업체거절하였습니다.";
							String loc = "companyManager.do";
							model.addAttribute("msg", agree);
							model.addAttribute("loc", loc);
						}

						return "common/msg";
					}else {
						System.out.println("알수없는 접근자가 접근했습니다.");
						return "redirect:/";
				}
			}else {
				System.out.println("로그인후 사용가능");
				return "redirect:/";
			}	
	}
	@RequestMapping(value=("/searchCompany.do"))
	public String searchCompany(HttpServletRequest request,String type , String keyword ,Model model) {
		int reqPage;
		HttpSession session = request.getSession(false); 
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
				if(m.getMemberId().equals("admin")) {
					AdminCompany ac = adminService.searchCompany(reqPage,type,keyword);
					model.addAttribute("ac", ac);
					return "admin/companyManagerPage";
				}else {
					System.out.println("알수없는 접근자가 접근했습니다.");
					return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}	
	}
	@RequestMapping("/viewstatusManager.do")
	public String viewstatusManager(HttpServletRequest request,Model model) {
		int reqPage;
		int typeCode;
		HttpSession session = request.getSession(false);
		try {
			typeCode = Integer.parseInt(request.getParameter("typeCode"));
		}catch(NumberFormatException e) {
			typeCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
			if(m.getMemberId().equals("admin")) {
				AdminCompany ac = adminService.viewManager(reqPage, typeCode);
				model.addAttribute("ac",ac );
				return "admin/viewstatusManagerPage";
			}else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/viewUpdate.do")
	public String viewUpdate(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
			if(session !=null&&(Member)session.getAttribute("member")!=null) {
				Member m = (Member)session.getAttribute("member");
					if(m.getMemberId().equals("admin")) {
						int result = adminService.view(num,code);
						if(result >0) {
							String agree = "공개설정 되었습니다.";
							String loc = "viewstatusManager.do";
							model.addAttribute("msg", agree);
							model.addAttribute("loc", loc);
						}
								return "common/msg";
					}else {
						System.out.println("알수없는 접근자가 접근했습니다.");
						return "redirect:/";
				}
			}else {
				System.out.println("로그인후 사용가능");
				return "redirect:/";
			}	
	}
	@RequestMapping(value="/unviewUpdate.do")
	public String unviewUpdate(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
			if(session !=null&&(Member)session.getAttribute("member")!=null) {
				Member m = (Member)session.getAttribute("member");
					if(m.getMemberId().equals("admin")) {
						int result = adminService.unview(num,code);
						if(result >0) {
							String agree = "비공개설정 되었습니다.";
							String loc = "viewstatusManager.do";
							model.addAttribute("msg", agree);
							model.addAttribute("loc", loc);
						}
								return "common/msg";
					}else {
						System.out.println("알수없는 접근자가 접근했습니다.");
						return "redirect:/";
				}
			}else {
				System.out.println("로그인후 사용가능");
				return "redirect:/";
			}	
	}
	@RequestMapping(value="/viewManagerSearch.do")
	public String viewManagerSearch(HttpServletRequest request,String type , String keyword ,Model model) {
		int reqPage;
		HttpSession session = request.getSession(false); 
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			Member m = (Member)session.getAttribute("member");
				if(m.getMemberId().equals("admin")) {
					AdminCompany ac = adminService.searchView(reqPage,type,keyword);
					model.addAttribute("ac", ac);
					return "admin/viewstatusManagerPage";
				}else {
					System.out.println("알수없는 접근자가 접근했습니다.");
					return "redirect:/";
			}
		}else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}	
	}
	
	@RequestMapping(value="/searchGoods.do")
	public String searchGoods(HttpServletRequest request, String keyword ,Model model) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		AdminGoods gList = adminService.searchGoods(reqPage,keyword);
		model.addAttribute("gList", gList);
		return "/admin/goodsCarePage";
	}
	@RequestMapping(value="/reservationManager.do")
	public String reservationManager(HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
	}
	
}
