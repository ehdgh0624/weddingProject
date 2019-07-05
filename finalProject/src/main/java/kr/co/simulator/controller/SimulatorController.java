package kr.co.simulator.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.collection.model.vo.Dress;
import kr.co.hall.vo.Hall;
import kr.co.member.model.vo.Member;
import kr.co.simulator.model.service.SimulatorService;
import kr.co.simulator.model.vo.Simulator;
import net.sf.json.JSONObject;

@Controller("simulatorController")
public class SimulatorController {

	@Autowired
	@Qualifier(value="simulatorService")
	private SimulatorService simulatorService;
	
	@RequestMapping(value = "/simulatorStandard.do")
	public String simulatorSearch(HttpServletRequest request, @RequestParam int start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam int weddingPerson, Model model) {
		System.out.println(weddingLoc+" , "+weddingDate+" , "+weddingPerson);
		
	
		
		
		HttpSession session = request.getSession(false);
		if(session != null && (Member)session.getAttribute("member") != null) {
			Member m = (Member)session.getAttribute("member");
			Simulator simulator = new Simulator(0,m.getMemberId(),weddingDate,weddingLoc,weddingPerson,0,null);
			
			//웨딩홀
			ArrayList<Hall> hList = simulatorService.hSearchList(simulator);
			if(!hList.isEmpty()) {
				System.out.println(hList.get(0).getHallName());
				model.addAttribute("hList", hList);
			}
			
			//웨딩드레스
			int Start = start;
			int dTotal = simulatorService.dTotalCount(simulator);
			ArrayList<Dress> dList = simulatorService.dSearchList(simulator, start);
			if(!dList.isEmpty()) {
				System.out.println(dList.get(0).getDressName());
				model.addAttribute("dTotal", dTotal);
				model.addAttribute("dList", dList);
			}
			
			System.out.println("됫다!");
		}else {
			
			
			System.out.println("안됫다!");
		}
		
		
		return "simulator/simulatorSelect";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/dressMore.do", produces="text/html;charset=utf-8")
	public String dressMore(HttpServletResponse response, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam int weddingPerson, @RequestParam int start) {
		int Start = start;
		Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,weddingPerson,0,null);
		ArrayList<Dress> dList = simulatorService.dSearchList(simulator, start);
		
		JSONObject obj = new JSONObject();
		obj.put("dList", dList);
		
		return new Gson().toJson(obj);
	}
	
}
