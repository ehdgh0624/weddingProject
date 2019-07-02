package kr.co.hall.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hall.service.HallService;

@Controller
public class HallController {
	@Autowired
	@Qualifier(value="hallService")
	private HallService hallService;
	
	@RequestMapping(value="/hall.do")
	public String hallPage() {
		return "hall/hall";
	}
}
