package kr.co.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import kr.co.admin.service.AdminService;
import kr.co.admin.vo.AdminCompany;
import kr.co.admin.vo.AdminGoods;
import kr.co.admin.vo.AdminMember;
import kr.co.admin.vo.AdminReservation;
import kr.co.gallery.model.vo.Gallery;
import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	@Qualifier(value = "adminService")
	AdminService adminService;

	@RequestMapping(value = "/addGoodsPage.do")
	public String addGoodsPage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {

				return "/admin/addGoodsPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/goodsCare.do")
	public String goodsCarePage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int code;
		int reqPage;
		try {
			code = Integer.parseInt(request.getParameter("code"));
		} catch (NumberFormatException e) {
			code = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminGoods gList = adminService.getGList(reqPage, code);
				model.addAttribute("gList", gList);

				return "/admin/goodsCarePage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/adminPage.do")
	public String adminPage(HttpServletRequest request, HttpSession session, Model model) {
		session = request.getSession(false);
		int reqPage;
		int ssCode;
		try {
			ssCode = Integer.parseInt(request.getParameter("sCode"));
		} catch (NumberFormatException e) {
			ssCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminMember list = adminService.memberAll(reqPage, ssCode);
				model.addAttribute("list", list);

				return "admin/adminPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/addGoods.do")
	public String addGoods(HttpServletRequest request, @RequestParam MultipartFile img, Goods g, Model model) {
		int result = 0;
		if (!img.isEmpty()) {
			SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmm");
			Date time = new Date();
			String time1 = fomat.format(time);
			String savePath = request.getSession().getServletContext().getRealPath("/resources/goods/");
			String originName = img.getOriginalFilename();
			// img1.jsp 실제파일명과 확장자 분리
			String onlyFileName = originName.substring(0, originName.indexOf("."));// 파일명
			String extension = originName.substring(originName.indexOf("."));// 확장자명
			String filepath = onlyFileName + "_" + time1 + extension; // 현재시간을 초단위까지 하면 파일명이 겹일일이 없다.
			String fullpath = savePath + "/" + filepath;
			try {
				byte[] bytes = img.getBytes();
				File f = new File(fullpath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				System.out.println("파일업로드성공");
				g.setGoodsFileName(originName);
				g.setGoodsFilePath(filepath);
				result = adminService.addGoods(g);
				if (result > 0) {
					bos.write(bytes);
					bos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			result = adminService.addGoods(g);
		}
		if (result > 0) {
			model.addAttribute("msg", "상품을 등록하였습니다.");
			model.addAttribute("loc", "goodsCare.do");
			return "common/msg";
		} else {
			model.addAttribute("msg", "상품을 등록하였습니다.");
			model.addAttribute("loc", "addGoods.do");
			return "common/msg";
		}
	}

	@RequestMapping("/searchMember.do")
	public String searchMember(HttpServletRequest request, String type, String keyword, Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminMember list = adminService.memberSearch(reqPage, type, keyword);
				model.addAttribute("list", list);

				return "admin/adminPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/companyManager.do")
	public String companyManager(HttpServletRequest request, Model model) {
		int reqPage;
		int typeCode;
		HttpSession session = request.getSession(false);
		try {
			typeCode = Integer.parseInt(request.getParameter("typeCode"));
		} catch (NumberFormatException e) {
			typeCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminCompany ac = adminService.companySearch(reqPage, typeCode);
				model.addAttribute("ac", ac);
				return "admin/companyManagerPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/agreeUpdate.do")
	public String agreeUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				int result = adminService.agree(num, code, id);
				if (result > 0) {
					String agree = "업체허가하였습니다.";
					String loc = "companyManager.do";
					model.addAttribute("msg", agree);
					model.addAttribute("loc", loc);
				}
				return "common/msg";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/rejectUpdate.do")
	public String rejectUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				int result = adminService.reject(num, code, id);
				if (result > 0) {
					String agree = "업체거절하였습니다.";
					String loc = "companyManager.do";
					model.addAttribute("msg", agree);
					model.addAttribute("loc", loc);
				}

				return "common/msg";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = ("/searchCompany.do"))
	public String searchCompany(HttpServletRequest request, String type, String keyword, Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminCompany ac = adminService.searchCompany(reqPage, type, keyword);
				model.addAttribute("ac", ac);
				return "admin/companyManagerPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping("/viewstatusManager.do")
	public String viewstatusManager(HttpServletRequest request, Model model) {
		int reqPage;
		int typeCode;
		HttpSession session = request.getSession(false);
		try {
			typeCode = Integer.parseInt(request.getParameter("typeCode"));
		} catch (NumberFormatException e) {
			typeCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminCompany ac = adminService.viewManager(reqPage, typeCode);
				model.addAttribute("ac", ac);
				return "admin/viewstatusManagerPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/viewUpdate.do")
	public String viewUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				int result = adminService.view(num, code);
				if (result > 0) {
					String agree = "공개설정 되었습니다.";
					String loc = "viewstatusManager.do";
					model.addAttribute("msg", agree);
					model.addAttribute("loc", loc);
				}
				return "common/msg";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/unviewUpdate.do")
	public String unviewUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int num = Integer.parseInt(request.getParameter("num"));
		String code = request.getParameter("code");
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				int result = adminService.unview(num, code);
				if (result > 0) {
					String agree = "비공개설정 되었습니다.";
					String loc = "viewstatusManager.do";
					model.addAttribute("msg", agree);
					model.addAttribute("loc", loc);
				}
				return "common/msg";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/viewManagerSearch.do")
	public String viewManagerSearch(HttpServletRequest request, String type, String keyword, Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminCompany ac = adminService.searchView(reqPage, type, keyword);
				model.addAttribute("ac", ac);
				return "admin/viewstatusManagerPage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/searchGoods.do")
	public String searchGoods(HttpServletRequest request, String keyword, Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminGoods gList = adminService.searchGoods(reqPage, keyword);
				model.addAttribute("gList", gList);
				return "/admin/goodsCarePage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/reservationManager.do")
	public String reservationManager(HttpServletRequest request, Model model) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminReservation ar = adminService.reservationManager(reqPage);
				model.addAttribute("ar", ar);
				return "admin/reserManager";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/reservationUpdate.do")
	public String reservationUpdate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int no = Integer.parseInt(request.getParameter("reservationNo"));
		int ds = Integer.parseInt(request.getParameter("deliveryStatus"));
		int os = Integer.parseInt(request.getParameter("orderStats"));
		String dn;
		if (request.getParameter("deliveryNum") != null) {
			dn = request.getParameter("deliveryNum");
		} else {
			dn = " ";
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				int result = adminService.reservationUpdate(no, ds, dn, os);
				if (result > 0) {
					model.addAttribute("msg", "주문 정보를 수정하였습니다.");
					model.addAttribute("loc", "reservationManager.do");
					return "common/msg";
				} else {
					model.addAttribute("msg", "주문 정보 수정 실패");
					model.addAttribute("loc", "reservationManager.do");
					return "common/msg";
				}
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/searchReser.do")
	public String searchReser(HttpServletRequest request, Model model) {
		int select = Integer.parseInt(request.getParameter("select"));
		int type = Integer.parseInt(request.getParameter("type"));
		String keyword;
		if (request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		} else {
			keyword = "none";
		}
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				AdminReservation ar = adminService.searchReser(reqPage, select, type, keyword);
				model.addAttribute("ar", ar);
				return "admin/reserManager";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}

	}

	@RequestMapping(value = "/goodsUpdatePage.do")
	public String goodsUpdatePage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
		String code = request.getParameter("code");
		System.out.println(goodsNo +"con");
		System.out.println(code +"con");
		if (session != null && (Member) session.getAttribute("member") != null) {
			Member m = (Member) session.getAttribute("member");
			if (m.getMemberCode().equals("2")) {
				Goods g = adminService.goodsUpdatePage(goodsNo);
				ArrayList<Gallery> ga = adminService.goodsGallery(goodsNo,code);
				model.addAttribute("g", g);
				model.addAttribute("gallery", ga);
				return "admin/goodsUpdatePage";
			} else {
				System.out.println("알수없는 접근자가 접근했습니다.");
				return "redirect:/";
			}
		} else {
			System.out.println("로그인후 사용가능");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/goodsUpdate.do")
	public String goodsUpdate(HttpServletRequest request, @RequestParam MultipartFile img, String oldFilename,
			String oldFilepath, Goods g, Model model) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/goods");
		if (!img.isEmpty()) {
			SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
			Date time = new Date();
			String time1 = fomat.format(time);
			System.out.println("savePath con: " + savePath);
			String oiginNname = img.getOriginalFilename();
			String onlyFilename = "";
			String extension = "";
			String filePath = "";
			// 파일명 확장자 나누기
			 // 새로 변경하였을때
				onlyFilename = oiginNname.substring(0, oiginNname.indexOf("."));
				extension = oiginNname.substring(oiginNname.indexOf("."));
				filePath = onlyFilename + "_" + time1 + extension;
			
			String fullPath = savePath + "/" + filePath;

			try {
				System.out.println("파일업로드 탄다");
				byte[] bytes = img.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				File fe = new File(savePath + "/" + oldFilepath);
				if (fe.exists()) { // 파일존재여부확인
					if (fe.isFile()) {
						fe.delete();
						System.out.println("삭제성공");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			g.setGoodsFileName(oiginNname);
			g.setGoodsFilePath(filePath);
		} else {
			g.setGoodsFileName(oldFilename);
			g.setGoodsFilePath(oldFilepath);
		}
		int result = adminService.goodsUpdate(g);
		if (result > 0) {
			model.addAttribute("msg", "상품정보를 변경했습니다");
			model.addAttribute("loc", "goodsCare.do");
			return "common/msg";
		} else {
			model.addAttribute("msg", "상품정보를 변경실패했습니다.");
			model.addAttribute("loc", "goodsCare.do");
			return "common/msg";
		}

	}

	@RequestMapping(value="/goodsdelete.do")
	public String goodsDelete(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
			if(session !=null&&(Member)session.getAttribute("member")!=null) {
				Member m = (Member)session.getAttribute("member");
					if(m.getMemberCode().equals("2")) {
						int result = adminService.goodsDelete(goodsNo);
						if(result>0) {
							model.addAttribute("msg", "상품을 삭제 했습니다");
							model.addAttribute("loc", "goodsCare.do");
							return "common/msg";
						}else {
							model.addAttribute("msg", "상품을 삭제를 실패 했습니다");
							model.addAttribute("loc", "goodsCare.do");
							return "common/msg";
						}
					}else {
						System.out.println("알수없는 접근자가 접근했습니다.");
						return "redirect:/";
				}
			}else {
				System.out.println("로그인후 사용가능");
				return "redirect:/";
			}	
	}
	@RequestMapping(value = "/adminCompanyDetailView.do")
	public ModelAndView adminCompanyDetailView(Model model,HttpServletRequest request) {
		System.out.println("업체상세페이지");
		ModelAndView mav = new ModelAndView();
		int no=Integer.parseInt(request.getParameter("prdNo"));
		String code=request.getParameter("code");
		HttpSession session = request.getSession(false);
		Member m = null;
		if(session != null && (Member)session.getAttribute("member") != null) {
			m =(Member)session.getAttribute("member"); 
		}
		if(code.equals("S")) {
		
			
			mav.addObject("studio", adminService.selectOneStudioNumber(no));
			mav.addObject("studioSelectList0", adminService.selectListStudioOptionNumber(no, 0));
			mav.addObject("studioSelectList1", adminService.selectListStudioOptionNumber(no, 1));
			mav.addObject("studioSelectList2", adminService.selectListStudioOptionNumber(no, 2));
			mav.addObject("galleryList", adminService.selectListGalleryNumber(no, "S"));
			
			mav.setViewName("member/companyDetailStudio");
			return mav;
			
		}else if(code.equals("D")) {
		
			mav.addObject("dress", adminService.selectOneDressNumber(no));
			mav.addObject("galleryList", adminService.selectListGalleryNumber(no, "D"));
			mav.setViewName("member/companyDetailDress");
			return mav;
		}else if(code.equals("M")){
	
			mav.addObject("makeup", adminService.selectOneMakeupNumber(no));
			mav.addObject("galleryList", adminService.selectListGalleryNumber(no, "M"));
			mav.setViewName("member/companyDetailMakeup");
			return mav;
		}else if(code.equals("H")){
			
			// 아직 홀 진행중	
			mav.addObject("hall", adminService.selectOneHallNumber(no));
			mav.addObject("galleryList", adminService.selectListGalleryNumber(no, "H"));
			mav.setViewName("member/companyDetailHall");
			return mav;
		}	
		return mav;	
	}

}