package kr.co.experience.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.experience.service.ExperienceService;
import kr.co.experience.vo.Experience;

@Controller
public class ExperienceController {	
	@Autowired
	private ExperienceService experienceService;		
	
	
	@RequestMapping(value="/experienceAll.do")
	public ModelAndView ExperienceAll() {		
		ArrayList<Experience> list = experienceService.ExperienceAll();
		ModelAndView mav = new ModelAndView();
		
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("experience/experienceAll");
		}else {			
		}				
		return mav;
	}
	@RequestMapping(value="/experienceDetail.do")
	public ModelAndView experienceDetail(@RequestParam int experienceNo) {
		
		Experience ex = new Experience();
		ex.setExperienceNo(experienceNo);
		Experience e = experienceService.experienceDetail(ex);
		ModelAndView mav = new ModelAndView();
		if(e!=null) {
			mav.addObject("experience",e);
			mav.setViewName("experience/experienceDetail");
			
		}else {			
		}	
		
		
		return mav;
	}
	
	
	@RequestMapping(value="/experienceWriting.do")
	public String experienceWriting() {
		return "experience/experienceWriting";
	}
	@RequestMapping(value="/uploadTest.do",method=RequestMethod.POST)
	public String uploadTest(HttpServletRequest request,@RequestParam MultipartFile fileTest, @RequestParam String test) {
		System.out.println("컨트롤");
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(savePath);
		String oiginNname = fileTest.getOriginalFilename();
		//파일명 확장자 나누기
		String onlyFilename =  oiginNname.substring(0, oiginNname.indexOf("."));
		String extension = oiginNname.substring(oiginNname.indexOf("."));
		//img`1 = 현재시간을 초단위.jsp
		String filePath = onlyFilename+"_"+"1"+extension;
		String fullPath = savePath +"/"+filePath;
		if(!fileTest.isEmpty()) {				
			try {				
			byte[] bytes = fileTest.getBytes();
			File f = new File(fullPath);
			FileOutputStream fos = new FileOutputStream(f);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(bytes);
			bos.close();
			System.out.println("파일업로드 성곤");						
			}catch (Exception e) {
				e.printStackTrace();
			}				
		}		
		return "redirect:/index.jsp";				
	}			
	
	
	
	
}
