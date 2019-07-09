package kr.co.hall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hall.service.HallService;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallPage;

@Controller
public class HallController {
	@Autowired
	@Qualifier(value="hallService")
	private HallService hallService;

	@RequestMapping(value="/hall.do")	// 홀리시트 불러오기(페이지 처리)
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
	
	@RequestMapping(value="/hallSc.do")
	   public ModelAndView hallsc(HttpServletRequest request,String hallLoc,String hallType,String menuType,String hallPerson,String searckHall) {
		Hall h = new Hall();
		h.setHallLoc(hallLoc);
		h.setHallType(hallType);
		h.setHallFoodtype(Integer.parseInt( menuType));
		int person ;
		h.setHallName(searckHall);
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
			person =  Integer.parseInt(hallPerson);
		} catch(NumberFormatException e) {
			reqPage = 1;
			person = 0;
		}	
		HallPage pd = hallService.HallSearch(reqPage,h,person);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd",pd);
		mav.setViewName("hall/hall");
	      return mav;
	   }
	
	
}
