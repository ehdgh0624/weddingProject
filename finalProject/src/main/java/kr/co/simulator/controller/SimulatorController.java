package kr.co.simulator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.simulator.model.service.SimulatorService;

@Controller("simulatorController")
public class SimulatorController {

	@Autowired
	@Qualifier(value="simulatorService")
	private SimulatorService simulatorService;
	
	//@RequestMapping(value = "/simulator.do")
	
	
}
