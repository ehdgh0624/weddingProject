package kr.co.test.controller;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.test.service.TestService;
import kr.co.test.vo.Test;

@Controller

public class TestController {
	@Autowired
	private TestService testService;


		
	
	
	@RequestMapping("/test.do")
	public void test(String editor) {		
		// 시작과 끝 그의 중간 이름값 가져오는 코드
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
		
	
		editor = editor.replaceAll("image2", "image");  // 마지막 디비 들어갈때 개행처리 
		
		int test = testService.test(editor);
		
		  
		
		  
	}

	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
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
	
	
	/*  delete.do 는 임시 파일 만들고 하루마다 갱신하니까 의미가 사라졌다. 
	@ResponseBody
	@RequestMapping(value="/delete.do")
	public void delete(String[] arr,HttpServletRequest request) {
		System.out.println("첫 arr" +arr);
		
		
//		String root = request.getSession().getServletContext().getRealPath("/"); // 절대경로 
//		System.out.println("경로가 어디로가되는거야 ? "+root);
		for(int i = 0 ; i<arr.length ; i++) {
		String realFile ="C:\\Users\\user1\\WeddingProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/"+arr[i].substring(arr[i].indexOf("ge/")+2);
		System.out.println("머야머야머야"+realFile);
	
		
		File file = new File(realFile);
		
		
		 if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }
	             
			}
	    }*/
	
	@RequestMapping(value="/testView.do")
	public ModelAndView testAll() {
		ArrayList<Test> list = testService.testAll();	
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("test/testAllList");
		}else {			
		}		
		return mav;
	}
	
}
