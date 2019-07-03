package kr.co.simulator.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.simulator.model.service.SimulatorService;

@Controller("simulatorController")
public class SimulatorController {

	@Autowired
	@Qualifier(value="simulatorService")
	private SimulatorService simulatorService;
	
	@RequestMapping(value = "/simulatorStandard.do")
	public String simulatorSearch(HttpServletRequest request, @RequestParam String weddingLoc, @RequestParam String weddingDate, @RequestParam String weddingPerson ) {
		return null;
	}
	
}
