package kr.co.simulator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.member.model.vo.MemberHall;
import kr.co.simulator.model.service.SimulatorService;

@Controller("simulatorController")
public class SimulatorController {

	@Autowired
	@Qualifier(value="simulatorService")
	private SimulatorService simulatorService;
	
	@RequestMapping(value = "/simulatorStandard.do")
	public String simulatorSearch(HttpServletRequest request, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson, Model model) {
		System.out.println(weddingLoc+" , "+weddingDate+" , "+weddingPerson);
		
		int person = Integer.parseInt(weddingPerson);
		MemberHall mh = new MemberHall();
		mh.setHallLoc(weddingLoc);
		//mh.setHallPerson(person);
		ArrayList<MemberHall> mhList = simulatorService.mhSearchList(mh);
		
		if(!mhList.isEmpty()) {
			System.out.println(mhList.get(0)+"\n"+mhList.get(0).getHallName());
			model.addAttribute("mhList", mhList);
		}
		
		
		return "simulator/simulatorSelect";
		
	}
	
}
