package kr.co.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.member.model.vo.Member;
import kr.co.reservation.model.service.ReservationService;
import kr.co.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;
	
	@RequestMapping("/reservationView.do")
	public ModelAndView selectOneReservation(HttpSession session, @RequestParam String memberId, @RequestParam int reservationNo) {
		System.out.println("예약페이지 뷰");
		Member m = (Member) session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		if(m != null) {
			Reservation res = null;
			System.out.println(memberId);
			if(m.getMemberId().equals(memberId)) {
				res = reservationService.selectOneReservation(reservationNo, m.getMemberId());				
			}else {
				res = reservationService.selectOneReservation(reservationNo, memberId);
			}
			
			if(res != null) {
				mav.addObject("reservation", res);
				mav.setViewName("reservation/reservationView");				
			}else {
				mav.addObject("cause", 2);
				mav.setViewName("reservation/reservationViewFailed");
			}
		}else {
			mav.addObject("cause", 1);
			mav.setViewName("reservation/reservationViewFailed");
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/cancelPay.do")
	public int updateOrderStatusCancel(HttpSession session, @RequestParam int reservationNo, @RequestParam String memberId) {
		System.out.println(reservationNo);
		System.out.println(memberId);
		Member m = (Member) session.getAttribute("member");
		int result = 0;
		if(m != null) {
			if(m.getMemberId().equals(memberId)) {
				result = reservationService.updateOrderStatusCancel(reservationNo);
			}
			return result;
		}else {
			return -1;
		}
	}
}
