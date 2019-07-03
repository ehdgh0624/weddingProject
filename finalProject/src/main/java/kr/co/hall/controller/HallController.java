package kr.co.hall.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hall.service.HallService;
import kr.co.hall.vo.HallPage;
import kr.co.member.model.vo.MemberHall;

@Controller
public class HallController {
	@Autowired
	@Qualifier(value="hallService")
	private HallService hallService;

	@RequestMapping(value="/hall.do")
	public ModelAndView allHallList() {	//홀 정보 리스트 불러오기
		ArrayList<MemberHall> list = hallService.allHallList();
		ModelAndView mav = new ModelAndView();
		 if(!list.isEmpty()) {
	         mav.addObject("list",list);
	         mav.setViewName("hall/hall");
	      }else {
	         mav.setViewName("hall/error");
	      }
	      return mav;
	}
	
//	@RequestMapping(value="/hall.do")
//	public ModelAndView allHallList(HttpServletRequest request) {	//홀 정보 리스트 불러오기
//		int reqPage;
//		try {
//			reqPage = Integer.parseInt(request.getParameter("reqPage"));
//		} catch(NumberFormatException e) {
//			reqPage = 1;
//		}	
//		HallPage pd = hallService.allHallList(reqPage);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("pd",pd);
//		mav.setViewName("hall/hall");
//	      return mav;
//	}
//	
//	@RequestMapping(value="/hallList.do")
//	public String hallList(HttpServletRequest request, String code) {
//		int reqPage;
//		try {
//			reqPage = Integer.parseInt(request.getParameter("reqPage"));
//		} catch(NumberFormatException e) {
//			reqPage = 1;
//		}	
//		if(code.equals("all")) {
//			return "redirect:/hall.do?reqPage="+reqPage;
//		}	
//		return "redirect:/hall.do?reqPage="+reqPage;
//	}
}
