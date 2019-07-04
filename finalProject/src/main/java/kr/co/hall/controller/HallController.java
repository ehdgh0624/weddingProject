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
	public ModelAndView allHallList(HttpServletRequest request) {	//홀 정보 리스트 불러오기
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}	
		HallPage pd = hallService.allHallList(reqPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd",pd);
		mav.setViewName("hall/hall");
	      return mav;
	}
	
	
}
