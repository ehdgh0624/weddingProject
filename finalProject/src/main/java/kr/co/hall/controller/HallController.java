package kr.co.hall.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.hall.service.HallService;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallPage;
import kr.co.hall.vo.HallSelect;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
import kr.co.scrapbook.model.vo.Scrapbook;

@Controller
public class HallController {
	@Autowired
	@Qualifier(value="hallService")
	private HallService hallService;

	@RequestMapping(value="/hall.do")	// 홀리시트 불러오기(페이지 처리)
	public ModelAndView allHallList(HttpServletRequest request,HttpSession session) {	//홀 정보 리스트 불러오기
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}	
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		HallPage pd = hallService.allHallList(reqPage,memberId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd",pd);
		System.out.println(pd.gethList());
		mav.setViewName("hall/hall");
	      return mav;
	}
	
	@RequestMapping(value="/hallSc.do")
	   public ModelAndView hallsc(HttpServletRequest request,String hallLoc,String hallType,String menuType,String hallPerson,String searckHall) {
		Hall h = new Hall();
		h.setHallLoc(hallLoc);
		h.setHallType(hallType);
		h.setHallFoodtype(Integer.parseInt( menuType));
		h.setHallName(searckHall);
		int person;
		int reqPage;
		try {
			 person =  Integer.parseInt(hallPerson);			
		}catch (NumberFormatException e) {
			 person = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}	
		HallPage pd = hallService.HallSearch(reqPage,h,person);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd",pd);
		mav.setViewName("hall/hall");
	      return mav;
	   }
	@RequestMapping(value="/hallPc.do")
	public ModelAndView hallPc(HttpServletRequest request) {
		int reqPage;
		int hhCode;
		try {
			hhCode = Integer.parseInt(request.getParameter("hCode"));
		}catch (NumberFormatException e) {
			hhCode = 0;
		}
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (NumberFormatException e) {
			reqPage = 1;
		}
		HallPage pd = hallService.hallPc(reqPage,hhCode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd",pd);
		mav.setViewName("hall/hall");
		return mav;
	}
	@RequestMapping(value="/hallView.do")
	public ModelAndView reservation(HttpSession session, @RequestParam int hallNo ) {
		Member m = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("hall",hallService.selectOneHall(hallNo));
		mav.addObject("galleryList", hallService.selectListGallery(hallNo, "H"));
		mav.addObject("reviewList", hallService.selectListReview(hallNo, "H"));
		mav.addObject("hallSelect",hallService.selectListHall(hallNo));
		if(m != null) {
			Scrapbook scrap = hallService.selectOneScrapbook(m.getMemberId(),hallNo, "H");
			mav.addObject("scrapbook",scrap);
		}			
		mav.setViewName("hall/hallView");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/hallOption.do", produces="text/html;charset=utf-8")
	public void selectOption(@RequestParam int result,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		HallSelect hs = hallService.selectOption(result);
		response.getWriter().println(new Gson().toJson(hs));
		
	}
	
	@ResponseBody
	@RequestMapping(value="/reservationHall.do")
	public int insertReservationHall(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdId, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam int price, @RequestParam int person, @RequestParam int foodType, @RequestParam int foodCount, @RequestParam String option) {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		if(m != null) {
			vo = new Reservation();
			vo.setCode(code);
			vo.setPrdNo(prdNo);
			vo.setPrdId(prdId);
			vo.setPrdName(prdName);
			vo.setWeddingTime(weddingTime);
			vo.setTotalPrice(totalPrice);
			vo.setMemberId(m.getMemberId());
			vo.setMemberName(m.getMemberName());
			vo.setMemberPhone(m.getPhone());
			vo.setMemberEmail(m.getEmail());
			vo.setHallSelect(option);
			vo.setHallPrice(price);
			vo.setHallPerson(person);
			vo.setHallFoodcount(foodCount);
			vo.setHallFoodtype(foodType);
			int result = hallService.insertReservationHall(vo,weddingDate);
			System.out.println(result);
			if(result > 0) {
				result = hallService.selectReservationNo(m.getMemberId());
				return result;
			}else {
				return result;
			}
		}else {
			return -1;
		}
	}
	
	@ResponseBody
	@RequestMapping("/hscrapOn.do")
	public int insertOneScrap(HttpSession session, @RequestParam int objectNo, @RequestParam String code) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
			String prdName = null;
			String prdFilepath = null;
			prdName = hallService.selectOneHall(objectNo).getHallName();
			prdFilepath = hallService.selectOneHall(objectNo).getHallPath();
			return hallService.insertOneScrap(objectNo, code, memberId, prdName, prdFilepath);
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping("/hscrapOff.do")
	public int deleteOneScrap(HttpSession session, @RequestParam int objectNo, @RequestParam String code) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
			return hallService.deleteOneScrap(objectNo, code, memberId);
		}else {
			return 0;
		}
	}
	@RequestMapping(value="/myHall.do")
	public ModelAndView myHall() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hall/myHall");
		return mav;
	}
}
