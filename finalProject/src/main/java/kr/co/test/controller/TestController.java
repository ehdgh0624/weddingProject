package kr.co.test.controller;


import static org.hamcrest.CoreMatchers.instanceOf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.test.service.TestService;

@Controller
public class TestController {
	@Autowired
	@Qualifier(value="testService")
	private TestService testService;
	
	@RequestMapping("/test.do")
	public String test(String editor) {
		System.out.println("콘트롤러");
		int test = testService.test(editor);
		
		return "/";
	}
}
