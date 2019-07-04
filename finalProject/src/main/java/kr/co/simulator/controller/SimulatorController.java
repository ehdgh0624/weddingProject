package kr.co.simulator.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.collection.model.vo.Dress;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberHall;
import kr.co.simulator.model.service.SimulatorService;
import kr.co.simulator.model.vo.Simulator;

@Controller("simulatorController")
public class SimulatorController {

	@Autowired
	@Qualifier(value="simulatorService")
	private SimulatorService simulatorService;
	
	@RequestMapping(value = "/simulatorStandard.do")
	public String simulatorSearch(HttpServletRequest request, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam int weddingPerson, Model model) {
		System.out.println(weddingLoc+" , "+weddingDate+" , "+weddingPerson);
		
		/*int person = Integer.parseInt(weddingPerson);
		MemberHall mh = new MemberHall();
		mh.setHallLoc(weddingLoc);
		ArrayList<MemberHall> mhList = simulatorService.mhSearchList(mh);
		
		if(!mhList.isEmpty()) {
			System.out.println(mhList.get(0)+"\n"+mhList.get(0).getHallName());
			model.addAttribute("mhList", mhList);
		}
		
		
		return "simulator/simulatorSelect";*/
		
		HttpSession session = request.getSession(false);
		if(session != null && (Member)session.getAttribute("member") != null) {
			Member m = (Member)session.getAttribute("member");
			Simulator simulator = new Simulator(0,m.getMemberId(),weddingDate,weddingLoc,weddingPerson,0,null);
			
			//웨딩홀
			/*ArrayList<MemberHall> mhList = simulatorService.mhSearchList(simulator);
			if(!mhList.isEmpty()) {
				model.addAttribute("mhList", mhList);
			}*/
			
			//웨딩드레스
			ArrayList<Dress> dList = simulatorService.dSearchList(simulator);
			if(!dList.isEmpty()) {
				model.addAttribute("dList", dList);
			}
			
			System.out.println("됫다!");
		}else {
			
			
			System.out.println("안됫다!");
		}
		
		
		return "simulator/simulatorSelect";
		
	}
	
}
