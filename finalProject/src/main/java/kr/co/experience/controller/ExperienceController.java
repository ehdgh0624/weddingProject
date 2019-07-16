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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.experience.service.ExperienceService;
import kr.co.experience.vo.Experience;
import kr.co.experience.vo.ExperienceComment;
import kr.co.experience.vo.ExperienceCommentData;
import kr.co.experience.vo.ExperienePageDate;
import kr.co.member.model.vo.Member;

@Controller
public class ExperienceController {
	@Autowired
	private ExperienceService experienceService;
	/*
	 * @RequestMapping(value="/experienceReview.do")
	 * 
	 */

	@RequestMapping(value = "/experienceAll.do")
	public String ExperienceAll(HttpServletRequest request) {

		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}

		return "redirect:/experienceAllList.do?reqPage=" + reqPage; // 페이지를 1 을 보내준다
	}

	@RequestMapping(value = "/experienceAllList.do")
	public ModelAndView experienceAllList(int reqPage) {

		ExperienePageDate expd = experienceService.edList(reqPage); // 받은 1을 이제 서비스로 보낸다
		ModelAndView mav = new ModelAndView();
		mav.addObject("expd", expd);
		mav.setViewName("experience/experienceAll");

		return mav;
	}

	@RequestMapping(value = "/exsearchExperience.do")
	public ModelAndView exsearchExperience(HttpServletRequest request, String type, String keyword) {
		int reqPage;
		HttpSession session = request.getSession(false);
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (NumberFormatException e) {
			reqPage = 1;
		}

		System.out.println("reqPage서치서치" + reqPage);
		ExperienePageDate expd = experienceService.exsearchExperience(reqPage, type, keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("expd", expd);
		mav.setViewName("experience/experienceAll");
		return mav;
	}

	@RequestMapping(value = "/experienceDetail.do")
	public ModelAndView experienceDetail(@RequestParam int experienceNo) {

		ExperienceCommentData e = experienceService.experienceDetail(experienceNo);

		ModelAndView mav = new ModelAndView();
		if (e.getE() != null) {
			mav.addObject("experience", e);
			mav.setViewName("experience/experienceDetail");

		} else {
		}

		return mav;
	}

	@RequestMapping(value = "exCommentReg.do")
	public ModelAndView exCommentReg(@RequestParam int experienceCommentNo, @RequestParam int experienceCommentRef) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("experienceCommentNo", experienceCommentNo);
		mav.addObject("experienceCommentRef", experienceCommentRef);
		mav.setViewName("experience/exCommentReg");
		return mav;
	}

	@RequestMapping(value = "exCommentRegs.do")
	public String exCommentRegs(HttpServletRequest request) {
		String experienceCommentWriter = request.getParameter("experienceCommentWriter");
		String experienceCommentContent = request.getParameter("experienceCommentContent");
		int experienceCommentNo = Integer.parseInt(request.getParameter("experienceCommentNo"));
		int experienceCommentLevel = Integer.parseInt(request.getParameter("experienceCommentLevel"));
		int experienceCommentRef = Integer.parseInt(request.getParameter("experienceCommentRef"));
		ExperienceComment e = new ExperienceComment();
		e.setExperienceCommentWriter(experienceCommentWriter);
		e.setExperienceCommentContent(experienceCommentContent);
		e.setExperienceCommentNo(experienceCommentNo);
		e.setExperienceCommentLevel(experienceCommentLevel);
		e.setExperienceCommentRef(experienceCommentRef);
		int result = experienceService.exCommentRegs(e);
		return "redirect:/views/close.jsp";
	}

	@RequestMapping(value = "/UpdateComments.do", method = RequestMethod.GET)
	public ModelAndView UpdateComments(@RequestParam int experienceCommentNo, String experienceCommentContent) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("experienceCommentNo", experienceCommentNo);
		mav.addObject("experienceCommentContent", experienceCommentContent);
		mav.setViewName("experience/updateComment");
		return mav;
	}

	@RequestMapping(value = "/UpdateComment.do")
	public String updateComment(HttpServletRequest request) {
		String experienceCommentContent = request.getParameter("experienceCommentContent");
		int experienceCommentNo = Integer.parseInt(request.getParameter("experienceCommentNo"));

		ExperienceComment e = new ExperienceComment();

		e.setExperienceCommentNo(experienceCommentNo);
		e.setExperienceCommentContent(experienceCommentContent);

		int result = experienceService.updateComment(e);

		return "redirect:/views/close.jsp";

	}

	@RequestMapping(value = "/experienceWriting.do")
	public String experienceWriting() {
		return "experience/experienceWriting";
	}

	@RequestMapping(value = "/uploadTest.do")
	public String uploadTest(HttpServletRequest request, @RequestParam MultipartFile experiencefile, String editor) {
		
		String experienceWriter = request.getParameter("experienceWriter");
		String imgInp = request.getParameter("imgInp");
		String experienceTitle = request.getParameter("experienceTitle");

	
	
		
		
		Pattern pattern2 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID				*pg 끝나는애.
		Matcher matcher2 = pattern2.matcher(editor);					// 그 정규표현식에 매칭 
		while (matcher2.find()) {	// 파인드 찾는다 							
			String as = matcher2.group();
			as = as.substring(0,as.length()-1);
			
			System.out.println(as);
		
		
			
	
		
			
		
			// 파일 복사 코드
			String file1 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/"
					+ as;
			String file2 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image/"
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String dates = sd.format(date);
		
		Experience ex = new Experience();

		editor = editor.replaceAll("image2", "image"); // 마지막 디비 들어갈때 개행처리

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");

		String oiginNname = experiencefile.getOriginalFilename();
		// 파일명 확장자 나누기
		String onlyFilename = oiginNname.substring(0, oiginNname.indexOf("."));
		String extension = oiginNname.substring(oiginNname.indexOf("."));
		// img`1 = 현재시간을 초단위.jsp
		String filePath = onlyFilename + dates + "1" + extension;
		String fullPath = savePath + "/"  +filePath;
		if (!experiencefile.isEmpty()) {
			try {
				byte[] bytes = experiencefile.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ex.setExperienceWriter(experienceWriter);
		ex.setExperienceTitle(experienceTitle);
		ex.setExperienceContent(editor);
		ex.setExperienceFilePath(filePath);
		ex.setExperienceFileName(oiginNname);
		int e = experienceService.insertexperience(ex);

		return "redirect:/index.jsp";

	}

	@RequestMapping(value = "/experienceUpload.do", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload, MultipartHttpServletRequest multiFile) {

		// 에디터 upload

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
					"C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/ID"
							+ filename + date1 +"KDC"+ filelast));
			out.write(bytes);
			
			System.out.println(fileName);

			// ck 에디터 이미지 업로드시 발생하는 코드
			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "http://192.168.10.92/resources/editor/image2/ID" + filename + date1 +"KDC"+filelast;// url경로
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

	@RequestMapping(value = "/experienceCommentInsert.do")
	public String experienceCommentInsert(HttpServletRequest request) {

		String experienceCommentWriter = request.getParameter("experienceCommentWriter");
		int experienceCommentRef = Integer.parseInt(request.getParameter("experienceCommentRef"));
		int experienceCommentLevel = Integer.parseInt(request.getParameter("experienceCommentLevel"));
		int experienceCommentCommentRef = Integer.parseInt(request.getParameter("experienceCommentCommentRef"));
		String experienceCommentContent = request.getParameter("experienceCommentContent");

		ExperienceComment ec = new ExperienceComment();

		ec.setExperienceCommentWriter(experienceCommentWriter);
		ec.setExperienceCommentRef(experienceCommentRef);
		ec.setExperienceCommentLevel(experienceCommentLevel);
		ec.setExperienceCommentCommentRef(experienceCommentCommentRef);
		ec.setExperienceCommentContent(experienceCommentContent);

		int result = experienceService.experienceCommentInsert(ec);

		return "redirect:/experienceDetail.do?experienceNo=" + experienceCommentRef;
	}

	@RequestMapping(value = "CommentDelete.do")
	public String CommentDelete(HttpServletRequest request) {
		System.out.println("삭제버튼 누름");
		int experienceCommentNo = Integer.parseInt(request.getParameter("experienceCommentNo"));
		int experienceNo = Integer.parseInt(request.getParameter("experienceNo"));

		int reuslt = experienceService.CommentDelete(experienceCommentNo);

		System.out.println(experienceCommentNo);
		System.out.println(experienceNo);
		return "redirect:/experienceDetail.do?experienceNo=" + experienceNo;
	}

	@RequestMapping(value = "/myexperience.do")
	public ModelAndView myexperience(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if (m != null) {
			memberId = m.getMemberId();
		}
		ArrayList<Experience> ex = experienceService.selectId(memberId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("ex", ex);
		mav.setViewName("experience/myexperience");
		return mav;

	}

	@RequestMapping(value = "/exDelete.do")
	public String exDelete(HttpServletRequest request) {

		int experienceNo = Integer.parseInt(request.getParameter("experienceNo"));

		int result = experienceService.exDelete(experienceNo);

		return "redirect:/myexperience.do";

	}

	@RequestMapping(value = "exChg.do")
	public ModelAndView exChg(HttpServletRequest request) {

		int experienceNo = Integer.parseInt(request.getParameter("experienceNo"));

		Experience ex = experienceService.exChg(experienceNo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("ex", ex);
		mav.setViewName("experience/exChg");
		return mav;
	}

	@RequestMapping(value = "/upDateloadTest.do")
	public String upDateloadTest(HttpServletRequest request, @RequestParam MultipartFile experiencefile,
			String editor ) {
		System.out.println("수정하기 버튼 눌름");
		System.out.println(experiencefile);
		int experienceNo = Integer.parseInt(request.getParameter("experienceNo"));
		String experienceWriter = request.getParameter("experienceWriter");
		String experienceTitle = request.getParameter("experienceTitle");

		
		
		
		
	
			
		
		
		
		
		String ed = editor;
		if(ed.contains("KDC")) {
			
		Pattern pattern5 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\""); //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID				*pg 끝나는애.
		Matcher matcher5 = pattern5.matcher(editor);					// 그 정규표현식에 매칭 
		
		
		while (matcher5.find()) {	// 파인드 찾는다 							
			
			String as = matcher5.group();
			as = as.substring(0,as.length()-1);			
			System.out.println(as +"::::as임");						
			// 파일 복사 코드
			String file1 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/"
					+ as ;
			String file2 = "C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image/"
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
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		String dates = sd.format(date);
		Experience ex = new Experience();
		editor = editor.replaceAll("image2", "image"); // 마지막 디비 들어갈때 문
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		
		
		System.out.println(experiencefile+"니다experiencefile입니다");
		String oiginNname = experiencefile.getOriginalFilename();
		String onlyFilename = "";
		String extension = "";
		String filePath="";
		System.out.println("오리지날 네임"+oiginNname);
		// 파일명 확장자 나누기
		
		if(!oiginNname.equals("")) {
			
		onlyFilename = oiginNname.substring(0, oiginNname.indexOf("."));
		 extension = oiginNname.substring(oiginNname.indexOf("."));
			 filePath = onlyFilename + dates + "1" + extension;
		}else {
			
				
			String pa = request.getParameter("oldFilepath");
			extension = pa.substring(pa.indexOf("."));
			
			onlyFilename = request.getParameter("oldFilename");
			
			filePath =  request.getParameter("oldFilepath");
		
		}
		
		// img`1 = 현재시간을 초단위.jsp
		
	
		
		
		String fullPath = savePath + "/" + filePath;
		
		if (!experiencefile.isEmpty()) {
			try {
				System.out.println("파일업로드 탄다"); 
				byte[] bytes = experiencefile.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				String experienceFilePath = request.getParameter("experienceFilePath");
				System.out.println(experienceFilePath+"::::experienceFilePath");
				File fe = new File("C:\\Users\\kd\\fin\\FinalProject\\finalProject\\src\\main\\webapp\\resources\\upload/"
						+ experienceFilePath);
				if (fe.exists()) { // 파일존재여부확인
					if (fe.isFile()) {
						fe.delete();
						System.out.println("삭제성공");
					}
				}
				
				
				
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
					
			
		
		Experience eFind = experienceService.eFind(experienceNo);
		System.out.println(eFind.getExperienceContent()); // 원래있던데이터
		String str = eFind.getExperienceContent();
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();				
		
		/*
		 * Pattern pattern = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\"");
		 * //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID *pg 끝나는애. Matcher matcher =
		 * pattern.matcher(str); // 원래있던 데이터
		 * 
		 * Pattern pattern2 = Pattern.compile("^*ID[\"']?([^>\"']+)[\"']?[^>]^*\"");
		 * //Pattern 정규표현식 쓰겟다고 하는것. (시작^ * 0개이상 IDID *pg 끝나는애. Matcher matcher2 =
		 * pattern2.matcher(editor);//수정할 데이터
		 */	
		
		String edit = editor;
		System.out.println(str+"::str");
		System.out.println(edit+"++edit");
		
		
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
		
		ex.setExperienceNo(experienceNo);
		ex.setExperienceWriter(experienceWriter);
		ex.setExperienceTitle(experienceTitle);
		ex.setExperienceContent(editor); // 내가 새로 주입할 데이터
		ex.setExperienceFilePath(filePath);
		ex.setExperienceFileName(oiginNname);
		int e = experienceService.upDateexperience(ex);

		return "redirect:/myexperience.do";

	}

}
