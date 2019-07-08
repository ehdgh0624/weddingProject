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
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
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
	
	//검색결과 초기 노출
	@RequestMapping(value = "/simulatorStandard.do")
	public String simulatorSearch(HttpServletRequest request, @RequestParam String start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson, Model model) {
		System.out.println(weddingLoc+" , "+weddingDate+" , "+weddingPerson);

		HttpSession session = request.getSession(false);
		if(session != null && (Member)session.getAttribute("member") != null) {
			Member m = (Member)session.getAttribute("member");
			Simulator simulator = new Simulator(0,m.getMemberId(),weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
			int Start = Integer.parseInt(start);
			
			//웨딩홀
			int hTotal = simulatorService.hTotalCount(simulator);
			ArrayList<Hall> hList = simulatorService.hSearchList(simulator, Start);
			if(!hList.isEmpty()) {
				System.out.println(hList.get(0).getHallName());
				model.addAttribute("hTotal", hTotal);
				model.addAttribute("hList", hList);
				model.addAttribute("simulator", simulator);
			}
			
			//웨딩드레스
			int dTotal = simulatorService.dTotalCount(simulator);
			ArrayList<Dress> dList = simulatorService.dSearchList(simulator, Start);
			if(!dList.isEmpty()) {
				System.out.println(dList.get(0).getDressName());
				model.addAttribute("dTotal", dTotal);
				model.addAttribute("dList", dList);
				model.addAttribute("simulator", simulator);
			}
			
			//메이크업
			int mTotal = simulatorService.mTotalCount(simulator);
			ArrayList<Makeup> mList = simulatorService.mSearchList(simulator, Start);
			if(!mList.isEmpty()) {
				System.out.println(mList.get(0).getMakeupName());
				model.addAttribute("mTotal", mTotal);
				model.addAttribute("mList", mList);
				model.addAttribute("simulator", simulator);
			}
			
			//스튜디오
			int stTotal = simulatorService.stTotalCount(simulator);
			ArrayList<Studio> stList = simulatorService.stSearchList(simulator, Start);
			if(!stList.isEmpty()) {
				System.out.println(stList.get(0).getStudioName());
				model.addAttribute("stTotal", stTotal);
				model.addAttribute("stList", stList);
				model.addAttribute("simulator", simulator);
			}
			
			System.out.println("됫다!");
		}else {
			System.out.println("안됫다!");
		}
		
		return "simulator/simulatorSelect";
		
	}
	
	//웨딩홀 Ajax
	@ResponseBody
	@RequestMapping(value = "/hallMore.do", produces="text/html;charset=utf-8")
	public String hallMore(HttpServletResponse response, @RequestParam String start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson) {
		int Start = Integer.parseInt(start);
		Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
		ArrayList<Hall> hList = simulatorService.hSearchList(simulator, Start);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject obj = new JSONObject();
		obj.put("dList", hList);
		
		return new Gson().toJson(obj);
	}
	
	//웨딩드레스 Ajax
	@ResponseBody
	@RequestMapping(value = "/dressMore.do", produces="text/html;charset=utf-8")
	public String dressMore(HttpServletResponse response, @RequestParam String start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson) {
		int Start = Integer.parseInt(start);
		Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
		ArrayList<Dress> dList = simulatorService.dSearchList(simulator, Start);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject obj = new JSONObject();
		obj.put("dList", dList);
		
		return new Gson().toJson(obj);
	}
	
	//메이크업 Ajax
	@ResponseBody
	@RequestMapping(value="/makeupMore.do", produces="text/html;charset=utf-8")
	public String makeupMore(HttpServletResponse response, @RequestParam String start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson) {
		int Start = Integer.parseInt(start);
		Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
		ArrayList<Makeup> mList = simulatorService.mSearchList(simulator, Start);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject obj = new JSONObject();
		obj.put("mList", mList);
		
		return new Gson().toJson(obj);
	}
	
	//스튜디오 Ajax
	@ResponseBody
	@RequestMapping(value="/studioMore.do", produces="text/html;charset=utf-8")
	public String studioMore(HttpServletResponse response, @RequestParam String start, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson) {
		int Start = Integer.parseInt(start);
		Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
		ArrayList<Studio> stList = simulatorService.stSearchList(simulator, Start);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject obj = new JSONObject();
		obj.put("stList", stList);
		
		return new Gson().toJson(obj);
	}
	
}
