package kr.co.experience.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.experience.service.ExperienceService;
import kr.co.experience.vo.Experience;
import kr.co.experience.vo.ExperienePageDate;

@Controller
public class ExperienceController {	
	@Autowired
	private ExperienceService experienceService;		
/*	
	@RequestMapping(value="/experienceReview.do")
	
	*/
	
	@RequestMapping(value="/experienceAll.do")
	public String ExperienceAll(HttpServletRequest request) {

		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage")); 
		}catch(NumberFormatException e) {
			reqPage = 1;
		}	
			
		return "redirect:/experienceAllList.do?reqPage="+reqPage; // 페이지를  1 을 보내준다 
	}
	
	
	@RequestMapping(value="/experienceAllList.do")
	public ModelAndView experienceAllList(int reqPage) {
		
		
	ExperienePageDate expd = experienceService.edList(reqPage); // 받은 1을 이제 서비스로 보낸다 
	ModelAndView mav =  new ModelAndView();
	mav.addObject("expd",expd);
	mav.setViewName("experience/experienceAll");
	
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
	public String uploadTest(HttpServletRequest request,@RequestParam MultipartFile experiencefile ,String editor) {
		
	
		
		String experienceWriter = request.getParameter("experienceWriter");
		String imgInp = request.getParameter("imgInp");
		String experienceTitle = request.getParameter("experienceTitle");
		System.out.println(experienceWriter+"//"+imgInp+"//"+experienceTitle);

		ArrayList<Integer> start = new ArrayList<Integer>();
		ArrayList<Integer> end = new ArrayList<Integer>();
		ArrayList<String> filename = new ArrayList<String>();	
		
		if(editor.length()>0) {
			int l=0;
			int i=0;
			do {
				l=editor.indexOf("/image2/", l+1);
				i++;
			
				start.add(l+8);
			}while(l+1<editor.length()&&l!=-1);		
		}				
		if(editor.length()>0) {
			int l=0;
			int i=0;
			
			do {
				l=editor.indexOf(".jpg", l+1);
				i++;
				
				end.add(l);
			}while(l+1<editor.length()&&l!=-1);
		}				
		for(int i=0; i<start.size()-1;i++) {
			filename.add(editor.substring(start.get(i),end.get(i)));
			// 파일 복사 코드
			String file1 = "C:\\Users\\user1\\WeddingProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/"+filename.get(i)+".jpg";
			String file2 = "C:\\Users\\user1\\WeddingProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image/"+filename.get(i)+".jpg";
			try {
				FileInputStream fis = new FileInputStream(file1);
				FileOutputStream fos = new FileOutputStream(file2);
				int tmp = 0;
				while ((tmp = fis.read()) != -1) {
					fos.write(tmp);                
				}
				fis.close();
				fos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//여기까지 파일복사 코드
		
		}
		Experience ex = new Experience();
		
		editor = editor.replaceAll("image2", "image");  // 마지막 디비 들어갈때 개행처리 
		
		
		
		System.out.println("컨트롤");
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(savePath);
		String oiginNname = experiencefile.getOriginalFilename();
		//파일명 확장자 나누기
		String onlyFilename =  oiginNname.substring(0, oiginNname.indexOf("."));
		String extension = oiginNname.substring(oiginNname.indexOf("."));
		//img`1 = 현재시간을 초단위.jsp
		String filePath = onlyFilename+"_"+"1"+extension;
		String fullPath = savePath +"/"+filePath;
		if(!experiencefile.isEmpty()) {				
			try {				
			byte[] bytes = experiencefile.getBytes();
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
		System.out.println(editor +"에디터");
		System.out.println(oiginNname +"파일네임");
		System.out.println(fullPath +"경로");
		
		ex.setExperienceWriter(experienceWriter);
		ex.setExperienceTitle(experienceTitle);
		ex.setExperienceContent(editor);
		ex.setExperienceFilePath(filePath);
		ex.setExperienceFileName(oiginNname);
		int e = experienceService.insertexperience(ex);
		System.out.println(ex);
		System.out.println(e);
		return "redirect:/index.jsp";
		
		
	}
	
	
	@RequestMapping(value = "/experienceUpload.do", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload,MultipartHttpServletRequest multiFile) {
		
		//에디터 upload
		
		PrintWriter printWriter = null;
        OutputStream out = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8"); //인코딩
       
        try {
        	request.setCharacterEncoding("utf-8");
        	String fileName = upload.getOriginalFilename();
        	System.out.println("fileName = "+fileName);
			byte[] bytes = upload.getBytes();
			/*
			String root = request.getSession().getServletContext().getRealPath("/"); // 절대경로 
			String uploadPath =root+fileName;//저장경로	*/			
		
			
			///// 글자 개행 및 날짜 맞춰서 초단위까지 해서 고유 파일처럼 보이게 하는 것
			
			int pos = fileName.indexOf("."); 
			String filename = fileName.substring(0, pos);
			String filelast = fileName.substring(pos,fileName.length());
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String date1 = sd.format(date);
			System.out.println(filename+date1);
			
			
			
			// 파일 아웃 스트림 
			out = new FileOutputStream(new File("C:\\Users\\user1\\WeddingProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/ID"+filename+date1+filelast));           
			out.write(bytes);
			
            
			
			
			//ck 에디터 이미지 업로드시 발생하는 코드 
			String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl =  "http://192.168.10.5/resources/editor/image2/ID"+filename+date1+filelast;//url경로           
            printWriter.println("<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>"
            		+ "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 .'"
                    + ");"                                                                               
                    + "</script>");
            //  printWriter.println (callback = 0,1 1이면 된다 , fileUrl =url 경로 쓰는것, alart 창과같다 ) 형식에 맞춰써야됨.
            printWriter.flush();                              
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        finally {
        	 try {
                 if (out != null) {
                     out.close();
                 }
                 if (printWriter != null) {
                     printWriter.close();
                 }
             } catch (IOException e) {
                 e.printStackTrace();
             }
        	
        }                       
      return;
	}
	
}
