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
import com.google.gson.JsonParser;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.member.model.vo.Member;
import kr.co.simulator.model.service.SimulatorService;
import kr.co.simulator.model.vo.Simulator;
import kr.co.simulator.model.vo.SimulatorSelect;
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
		Simulator simulator = null;
		
		//로그인 했을때
		if(session != null && (Member)session.getAttribute("member") != null) {
			Member m = (Member)session.getAttribute("member");
			simulator = new Simulator(0,m.getMemberId(),weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
			
			System.out.println("됫다!");
		}else { //로그인 안했을때
			simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
			System.out.println("안됫다!");
		}
		
		int Start = Integer.parseInt(start);
		
		//웨딩홀
		int hTotal = simulatorService.hTotalCount(simulator);
		ArrayList<Hall> hList = simulatorService.hSearchList(simulator, Start);
		if(!hList.isEmpty()) {
			System.out.println(hList.get(0).getHallName());
			model.addAttribute("hTotal", hTotal);
			model.addAttribute("hList", hList);
			model.addAttribute("simulator", simulator);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
		}
		
		//웨딩드레스
		int dTotal = simulatorService.dTotalCount(simulator);
		ArrayList<Dress> dList = simulatorService.dSearchList(simulator, Start);
		if(!dList.isEmpty()) {
			System.out.println(dList.get(0).getDressName());
			model.addAttribute("dTotal", dTotal);
			model.addAttribute("dList", dList);
			model.addAttribute("simulator", simulator);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
		}
		
		//메이크업
		int mTotal = simulatorService.mTotalCount(simulator);
		ArrayList<Makeup> mList = simulatorService.mSearchList(simulator, Start);
		if(!mList.isEmpty()) {
			System.out.println(mList.get(0).getMakeupName());
			model.addAttribute("mTotal", mTotal);
			model.addAttribute("mList", mList);
			model.addAttribute("simulator", simulator);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
		}
		
		//스튜디오
		int stTotal = simulatorService.stTotalCount(simulator);
		ArrayList<Studio> stList = simulatorService.stSearchList(simulator, Start);
		if(!stList.isEmpty()) {
			System.out.println(stList.get(0).getStudioName());
			model.addAttribute("stTotal", stTotal);
			model.addAttribute("stList", stList);
			model.addAttribute("simulator", simulator);
		}else {
			model.addAttribute("msg", "검색결과가 없습니다.");
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
		obj.put("hList", hList);
		
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
	
	
	//나의 웨딩 계산결과 보기
	@RequestMapping(value="/simulatorCheck.do")
	public String cartSideBar(HttpServletRequest request, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson, String option, Model model) {
		System.out.println("여기이이 "+option);
		System.out.println(weddingLoc+weddingDate+weddingPerson);
		
		HttpSession session = request.getSession(false);
		
		//넘어온 String 타입 option을 Json 타입으로 파싱
		JsonParser parser = new JsonParser();
		Object obj = parser.parse(option);
		
		//전체 카테고리 리스트
		com.google.gson.JsonArray jsonArr = (com.google.gson.JsonArray)obj;
		System.out.println("배열 길이 : "+jsonArr.size());
		
		//선택한 카테고리 하나!
		com.google.gson.JsonObject jsonObj = null;
		SimulatorSelect simulatorSelect = null;
		ArrayList<SimulatorSelect> simulatorList = new ArrayList<SimulatorSelect>();
		int totalPrice = 0;
		
		//com.google.gson.JsonObject jsonObj = (com.google.gson.JsonObject)jsonArr.get(0);
		//String name = jsonObj.get("1").getAsString();

		if(session != null && (Member)session.getAttribute("member") != null) { //로그인 했을 때
			Member m = (Member)session.getAttribute("member");
			Simulator simulator = new Simulator(0,m.getMemberId(),weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
			
			// Simulator 생성
			int result = simulatorService.newSimulator(simulator);
			if(result > 0) { //Simulator 생성 성공 시
				if(jsonArr.size() != 0) {
					for(int i=0;i<jsonArr.size();i++) {
						jsonObj = (com.google.gson.JsonObject)jsonArr.get(i);
						
						simulatorSelect = new SimulatorSelect();
						int simulatorNo = simulatorService.simulatorNo(simulator);
						System.out.println("여기기ㅣㅣㅣㅣ : "+simulatorNo);
						
						simulatorSelect.setSimulatorNo(simulatorNo);
						simulatorSelect.setCode(jsonObj.get("2").getAsString());
						simulatorSelect.setPrdNo(jsonObj.get("1").getAsInt());
						simulatorSelect.setPrdName(jsonObj.get("4").getAsString());
						simulatorSelect.setPrdPrice(jsonObj.get("6").getAsInt());
						simulatorSelect.setPrdTel(jsonObj.get("3").getAsString().replace('/', '-'));
						simulatorSelect.setPrdLoc(jsonObj.get("5").getAsString());
						simulatorSelect.setPrdTag(jsonObj.get("7").getAsString());
						simulatorSelect.setPrdFilepath(jsonObj.get("0").getAsString());
						
						int selectResult = simulatorService.newSimulatorSelect(simulatorSelect);
						if(selectResult > 0) {
							simulatorList.add(simulatorSelect);
							totalPrice += simulatorSelect.getPrdPrice();
							int priceResult = simulatorService.updatePrice(simulatorNo, totalPrice);
							System.out.println(priceResult);
							if(priceResult > 0) {
								simulator.setSimulatorTotalPrice(totalPrice);
							}
						}else {
							System.out.println("실패");
						}
					}
					
					model.addAttribute("simulatorList", simulatorList);
					
				}else {
					model.addAttribute("msg", "선택하신 것이 없습니다.");
				}
				
				model.addAttribute("simulator", simulator);
				model.addAttribute("totalPrice", totalPrice);
				
				System.out.println("성공");
				
			}else { //Simulator 생성 실패 시
				System.out.println("실패");
			}
			
			System.out.println("로그인 후");
		}else { //로그인 안했을 때
			Simulator simulator = new Simulator(0,null,weddingDate,weddingLoc,Integer.parseInt(weddingPerson),0,null);
			if(jsonArr.size() != 0) {
				for(int i=0;i<jsonArr.size();i++) {
					jsonObj = (com.google.gson.JsonObject)jsonArr.get(i);
					
					simulatorSelect = new SimulatorSelect();
					
					simulatorSelect.setCode(jsonObj.get("2").getAsString());
					simulatorSelect.setPrdNo(jsonObj.get("1").getAsInt());
					simulatorSelect.setPrdName(jsonObj.get("4").getAsString());
					simulatorSelect.setPrdPrice(jsonObj.get("6").getAsInt());
					simulatorSelect.setPrdTel(jsonObj.get("3").getAsString().replace('/', '-'));
					simulatorSelect.setPrdLoc(jsonObj.get("5").getAsString());
					simulatorSelect.setPrdTag(jsonObj.get("7").getAsString());
					simulatorSelect.setPrdFilepath(jsonObj.get("0").getAsString());
					
					simulatorList.add(simulatorSelect);
					System.out.println(simulatorList.size());
					System.out.println(simulatorSelect.getPrdName());
					totalPrice += simulatorSelect.getPrdPrice();
				}
				System.out.println("여기!! : "+simulatorList.size());
				
				model.addAttribute("simulatorList", simulatorList);
				
			}else {
				model.addAttribute("msg", "선택하신 것이 없습니다.");
			}
			
			model.addAttribute("simulator", simulator);
			model.addAttribute("totalPrice", totalPrice);
			
			System.out.println("로그인 전");
		}
		
		return "simulator/simulatorCheck";
	}
}
