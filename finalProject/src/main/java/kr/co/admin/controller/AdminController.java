package kr.co.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import kr.co.admin.vo.AdminMember;
import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	@Qualifier(value="adminService")
	AdminService adminService;
	
	@RequestMapping(value="addGoodsPage")
	public String addGoodsPage() {
		return "/admin/addGoodsPage";
	}
	
	
	@RequestMapping(value="/adminPage.do")
	public String adminPage(HttpServletRequest request,HttpSession session,Model model) {
		session = request.getSession(false);
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
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
	
}
