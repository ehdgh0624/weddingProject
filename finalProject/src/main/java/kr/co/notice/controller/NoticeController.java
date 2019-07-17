package kr.co.notice.controller;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.experience.vo.Experience;
import kr.co.notice.service.NoticeService;
import kr.co.notice.vo.Notice;
import kr.co.notice.vo.NoticePageData;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier(value="noticeService")
	NoticeService noticeService;
	
	@RequestMapping(value="/noticeMain.do")
	public String noticeMain(HttpServletRequest request,Model model) {
		
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1; 
		}
		
		NoticePageData npd = noticeService.noticeAll(reqPage);
		model.addAttribute("npd", npd);
		return "notice/noticemain";
	}
	@RequestMapping(value="/noticeView.do")
	public String noticeView(HttpServletRequest request , Model model) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		Notice n = noticeService.noticeView(noticeNo);
		model.addAttribute("n",n);
		return "notice/noticeView";
	}
	@RequestMapping(value="/noticeWriting.do") // 작성
	public String noticeWriting() {
		return "notice/noticeWriting";
	}
	@RequestMapping(value="/noticeUpload.do",method = RequestMethod.POST) //이미지 업도르 누를시 작용하는곳 에디터 
	public void noticeWriting(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload, MultipartHttpServletRequest multiFile) {
		
	

			PrintWriter printWriter = null;
			OutputStream out = null;
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8"); // 인코딩

			try {
				request.setCharacterEncoding("utf-8");
				String fileName = upload.getOriginalFilename();

				byte[] bytes = upload.getBytes();
				/*
				 * String root = request.getSession().getServletContext().getRealPath("/"); //
				 * 절대경로 String uploadPath =root+fileName;//저장경로
				 */

				///// 글자 개행 및 날짜 맞춰서 초단위까지 해서 고유 파일처럼 보이게 하는 것

				int pos = fileName.indexOf(".");
				String filename = fileName.substring(0, pos);
				String filelast = fileName.substring(pos, fileName.length());
				SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = new Date();
				String date1 = sd.format(date);

				
				// 파일 아웃 스트림
				out = new FileOutputStream(new File(
						"C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\notice2/ID"
								+ filename + date1 +"KDC"+ filelast));
				out.write(bytes);
				
				System.out.println(fileName);

				// ck 에디터 이미지 업로드시 발생하는 코드
				String callback = request.getParameter("CKEditorFuncNum");
				printWriter = response.getWriter();
				String fileUrl = "http://192.168.10.92/resources/editor/notice2/ID" + filename + date1 +"KDC"+filelast;// url경로
				printWriter.println(
						"<script src='https://code.jquery.com/jquery-3.4.0.js' integrity='sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo='crossorigin='anonymous'></script>"
								+ "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback
								+ ",'" + fileUrl + "','이미지를 업로드 .'" + ");" + "</script>");
				// printWriter.println (callback = 0,1 1이면 된다 , fileUrl =url 경로 쓰는것, alart 창과같다
				// ) 형식에 맞춰써야됨.
				printWriter.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
	@RequestMapping(value="/noticeWriting2.do")
	public String noticeUpload(HttpServletRequest request, String editor) {
		String noticeWriter = request.getParameter("userId");
		String noticeTitle = request.getParameter("noticeTitle");
		Pattern pattern2 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID				*pg 끝나는애.
		Matcher matcher2 = pattern2.matcher(editor);					// 그 정규표현식에 매칭 
		while (matcher2.find()) {	// 파인드 찾는다 							
			String as = matcher2.group();
			as = as.substring(0,as.length()-1);
			System.out.println(as);
			// 파일 복사 코드
			String file1 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\notice2/"
					+ as;
			String file2 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\notice/"
					+ as;
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
			// 여기까지 파일복사 코드

		}// png까지 불러옴
		Notice n = new Notice();
		editor = editor.replaceAll("notice2", "notice"); // 마지막 디비 들어갈때 개행처리
		n.setNoticeTitle(noticeTitle);
		n.setNoticeWriter(noticeWriter);
		n.setNoticeContent(editor);
		
		int ne = noticeService.insertNotice(n);
		return "redirect:/index.jsp";
	}
	@RequestMapping(value="noticeUpdateView.do")
	public ModelAndView noticeUpdateView(HttpServletRequest request) {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		Notice n = noticeService.noticeUpdateView(noticeNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", n);
		mav.setViewName("notice/noticeUpdate");
		return mav;
	}
	@RequestMapping(value="/noticeUpDate.do")
	public String noticeUpDate(HttpServletRequest request,String editor) {
		String noticeTitle = request.getParameter("noticeTitle");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeWriter =request.getParameter("noticeWriter");
		
		String ed = editor;
		if(ed.contains("KDC")) {			
		Pattern pattern5 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID				*pg 끝나는애.
		Matcher matcher5 = pattern5.matcher(editor);					// 그 정규표현식에 매칭 
		while (matcher5.find()) {	// 파인드 찾는다 							
			String as = matcher5.group();
			as = as.substring(0,as.length()-1);			
			System.out.println(as +"::::as임");						
			// 파일 복사 코드
			String file1 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\notice2/"
					+ as ;
			String file2 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\notice/"
					+ as ;			
			System.out.println(file1+":::::file1");
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
		}
	}	
		Notice n = new Notice();
		Notice nFind = noticeService.noticeView(noticeNo);
		String str = nFind.getNoticeContent();
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();					
		String edit = editor;			
		if(str.contains("KDC") && !edit.contains("KDC") ) {//수정전 이미지는 있고 수정하고 난뒤 이미지가 다 없을때. == image 에있는거 다삭제
			System.out.println("수정전 이미지는 있고 수정하고 난뒤 이미지가 다 없을때");
			Pattern pattern = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID				*pg 끝나는애.
			Matcher matcher = pattern.matcher(str);	// 원래있던 데이터	
			while (matcher.find()) {	// 파인드 찾는다 							
				String as = matcher.group();
				as = as.substring(0,as.length()-1);
				list.add(as);
				System.out.println(as+ "list1임");
				}
			for (int i = 0; i < list.size(); i++) { // 반복문으로 list 사이즈 만큼 반복한다.
				File listDetele = new File(
						"C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image/"
								+ list.get(i));  // 파일 선언으로 내가 가져온 list(i) 값을 경로를 잡아준다
				listDetele.delete();
				System.out.println("삭제성공");
			}	
			
		}else if(!str.contains("KDC") && edit.contains("KDC") ) {//수정전 이미지가 없고 수정한뒤 이미지가 추가되었을때. == imge만 추가다.
			System.out.println("수정전 이미지가 없고 수정한뒤 이미지가 추가되었을때");
			System.out.println("아무것도안한다  삭제할것없다");
			
		}else if(!str.contains("KDC") && !edit.contains("KDC") ) {// 둘다 이미지가 없을때
			System.out.println("둘다 이미지가 없을때");
			System.out.println("아무것도안한다");
			
		}else {
			System.out.println("else 문으로 들어왓다");
			Pattern pattern = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것.		
			Matcher matcher = pattern.matcher(str);	// 원래있던 데이터	
			
			Pattern pattern2 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. 			
			Matcher matcher2 = pattern2.matcher(editor);//수정할 데이터
			
			while (matcher.find()) {	// 파인드 찾는다 							
				String as = matcher.group();
				as = as.substring(0,as.length()-1);
				list.add(as);
				System.out.println(as+ "list1임");
				}	
			while (matcher2.find()) {	// 파인드 찾는다 							
				String asd = matcher2.group();
				asd = asd.substring(0,asd.length()-1);
				list2.add(asd);
				System.out.println(asd+"list1임");
				}
			for (int i = 0; i < list.size(); i++) { // 반복문으로 list 사이즈 만큼 반복한다.
				File listDetele = new File(
						"C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image/"
								+ list.get(i));  // 파일 선언으로 내가 가져온 list(i) 값을 경로를 잡아준다		
				boolean result = true; // 참 거짓으로 구분짓는다
				for (int j = 0; j < list2.size(); j++) {     // 반복문으로 list2 사이즈만큼 반복한다.
					if (list.get(i).equals(list2.get(j))) {  // if 문 list(i) 가 list2(i) 값는것이 있는지 반복해서 확인한다.
						System.out.println("같으면 삭제안해야지"); 
						result = false; // 같은게있다면 거짓으로 바꾸고 브레이크
						break;
					}
					
				}
				if(result) { // 이제 참인것들은 다 같은것들이 아니니까  걸려져서 삭제가 됩니다.
					if (listDetele.exists()) { // 파일존재여부확인
						if (listDetele.isFile()) {
							listDetele.delete();
							System.out.println("삭제성공");
						}
					} 
				}
				
			}//for 문 끝		
		}
		
		n.setnoticeNo(noticeNo);
		n.setNoticeWriter(noticeWriter);
		n.setNoticeContent(editor);
		n.setNoticeTitle(noticeTitle);	
		int e = noticeService.updateNotice(n);
		return "redirect:/noticeMain.do";	
	}
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(HttpServletRequest request) {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		int reuslt = noticeService.noticeDelete(noticeNo);
		
		return "redirect:/noticeMain.do";
	}
	
}
