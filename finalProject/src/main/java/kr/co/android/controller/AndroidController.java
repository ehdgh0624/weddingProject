package kr.co.android.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.android.model.service.AndroidService;
import kr.co.android.model.vo.ReservationList;
import kr.co.member.controller.MemberController;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;

@Controller
public class AndroidController {
	
	@Autowired
	@Qualifier(value="androidService")
	AndroidService androidService;
	
	@RequestMapping(value = "/android.do")
	public void androidTest() {
		System.out.println("안드로이드 로 접근했습니다.");
	}
	
	@RequestMapping(value = "/oneTimeLogin.do")
	@ResponseBody
	public Map<String, Object> oneTimeLogin(HttpServletRequest request) {
		String memberId=request.getParameter("id");
		String memberPw= request.getParameter("pw");
		
		System.out.println(memberId+memberPw);
		System.out.println("간편로그인입니다");
		
		Random ran = new Random();
		
		int random=ran.nextInt(999999)+1;
		String number=Integer.toString(random);
		

		
		int result2 = androidService.deleteOneTimeLogin(memberId);
		
		int result=androidService.saveOneTimeLogin(number,memberId);
		
		Timer m_timer = new Timer();
		TimerTask m_task = new TimerTask() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				 androidService.deleteOneTimeLogin(memberId);
			}
		};
		
		m_timer.schedule(m_task, 60000);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("number",number);
		return map;
	}
	
	@RequestMapping(value = "/android2.do")
	@ResponseBody
	public Map<String, Object> androidTest2(HttpServletRequest request) {
		String memberId=request.getParameter("id");
		String memberPw= request.getParameter("pw");
		
		Member m =androidService.login(memberId,memberPw);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		if(m==null) {
			result.put("memberName","로그인실패");
			result.put("memberCode", "404");
		}else {
			result.put("memberNo", m.getMemberNo());
			result.put("memberId", m.getMemberId());
			result.put("memberPw", m.getMemberPw());
			result.put("memberName", m.getMemberName());
			result.put("phone", m.getPhone());
			result.put("birthDay", m.getBirthDay());
			result.put("email", m.getEmail());
			result.put("addr", m.getAddr());
			result.put("marrySchedule", m.getMarrySchedule().toString());
			result.put("expectVisitor", m.getExpectVisitor());
			result.put("budget", m.getBudget());
			result.put("memberCode", m.getMemberCode());
		}
		
	
		
		
		
		return result;
	}
	
	@RequestMapping(value = "/androidGetReservation.do")
	@ResponseBody
	public Map<String, Object> androidGetReserVation(HttpServletRequest request) {
		String memberId=request.getParameter("id");
		
		System.out.println("접근중:"+memberId);
		ArrayList<Reservation> List = (ArrayList<Reservation>)androidService.getReservation(memberId);
		
		
		
		Map<String, Object> result = new HashMap<String, Object>();

		ReservationList rlist = new ReservationList();
		
		rlist.setList(List);
		
		
		Gson gson = new Gson();
		String msg = gson.toJson(rlist);
		result.put("result", msg);
		System.out.println(result);
		
		
		
		
		return result;
	}
	
	
	@RequestMapping(value = "/viewInvitation.do")
	@ResponseBody
	public Map<String, Object> viewInvitation(HttpServletRequest request) {
		String memberId=request.getParameter("id");
		
		System.out.println("접근중:"+memberId);
		androidService.getMyInvitation(memberId);
		
		
		
		Map<String, Object> result = new HashMap<String, Object>();

		
		
		
		Gson gson = new Gson();
		
		
		return result;
	}
	
   
    

	
}
