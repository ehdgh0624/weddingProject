package kr.co.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.collection.model.service.CollectionService;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.gallery.model.vo.Gallery;
import kr.co.hall.service.HallService;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelect;
import kr.co.hall.vo.HallSelectList;
import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.MailVO;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberAll;
import kr.co.member.model.vo.MemberEnroll;
import kr.co.member.model.vo.SDMList;
import kr.co.reservation.model.vo.Reservation;
import kr.co.reservation.model.vo.ReservationComparator;
import kr.co.scrapbook.model.vo.Scrapbook;
import kr.co.simulator.model.vo.Simulator;
import kr.co.simulator.model.vo.SimulatorSelect;
import kr.co.email.controller.*;;


@Controller
public class MemberController {

	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	@Qualifier(value="emailSender")
	private EmailSender emailSender;
	
	
	@RequestMapping(value = "/printId.do")
	public String printId(@RequestParam String email) {
		System.out.println("아이디찾기 호출");
		
		
		
		return "member/findId";
	}
	
	
	@RequestMapping(value = "/findId.do")
	public String findId() {
		System.out.println("아이디찾기 호출");
		
		return "member/findId";
	}
	

	
	@RequestMapping(value = "/findPw.do")
	public String findPw() {
		System.out.println("비밀번호찾기 호출");
		
		return "member/findPw";
	}
	
	@RequestMapping(value = "/idList.do")
	public String idList(HttpServletRequest request,Model model) {
		System.out.println("아이디 리스트 호출");
		String email=request.getParameter("email");
		System.out.println(email);
		ArrayList<Member> list=(ArrayList<Member>) memberService.getIdList(email);
		
		
		System.out.println("아이디 받아왔습니다"+list.get(0).getMemberId());
		for(int i=0; i<list.size();i++) {
			String id=list.get(i).getMemberId();
			
			String changeFrontId=id.substring(0, 4);
			
			int countstr=id.substring(4).length();
			for(int j=0;j<countstr;j++) {
				changeFrontId=changeFrontId+"*";
			}
			list.get(i).setMemberId(changeFrontId);
		
			System.out.println(changeFrontId);
		}
		
		
		
		model.addAttribute("list", list);
		
		return "member/idSearchList";
	}
	
	@RequestMapping(value = "/deleteGallery.do")
	@ResponseBody
	public void deleteGallery(HttpServletRequest request,@RequestParam String filepath,@RequestParam String code) {
		String savePath="";
		if(code.equals("S")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/studio");
		}else if(code.equals("D")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/dress");
		}else if(code.equals("M")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/makeup");
		}else if(code.equals("H")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/hall");
		}else if(code.equals("B")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/goods");
		}else if(code.equals("I")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/goods");
		}
		File fe = new File(savePath + "/" + filepath);
		if (fe.exists()) { // 파일존재여부확인
			if (fe.isFile()) {
				fe.delete();
			}
		}
		memberService.deleteGallery(filepath);
	}

	@RequestMapping(value = "/changePw.do")
	@ResponseBody
	public String changePw(@RequestParam String pwinput,@RequestParam String id) {
		System.out.println(pwinput);
		System.out.println(id);
		int result=memberService.changePw(pwinput,id);
		System.out.println(result);
		JSONObject obj = new JSONObject();
		if(result>0) {
			obj.put("result", "1");
		}else {
			obj.put("result", "0");
		}
	
		return new Gson().toJson(obj);
	}
	
	@RequestMapping(value = "/checkId.do")
	@ResponseBody
	public String checkId(@RequestParam String id) {
		
		Member m=memberService.checkId(id);
		JSONObject obj = new JSONObject();
		if(m!=null) {
			obj.put("result", "0");
		}else {
			obj.put("result", "1");
		}
	
		return new Gson().toJson(obj);
	}
	
	@RequestMapping(value = "/saveGallery.do")
	public String saveGallery(
			@RequestParam(value="filename",required = true) List<MultipartFile> filenameList,
			HttpServletRequest request
			) {
		String code=request.getParameter("code");
		String no= request.getParameter("prdNo");
		String savePath="";
		ArrayList<String> originNameList = new ArrayList<String>();
		ArrayList<String> onlyFileNameList = new ArrayList<String>();
		ArrayList<String> extensionList = new ArrayList<String>();
		
		SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
		Date time = new Date();
		String time1 = fomat.format(time);
		
		for(int i=0;i<filenameList.size();i++) {
			originNameList.add(filenameList.get(i).getOriginalFilename());
			System.out.println(filenameList.get(i).getOriginalFilename());
			onlyFileNameList.add(originNameList.get(i).substring(0,originNameList.get(i).indexOf(".")));
			extensionList.add(originNameList.get(i).substring(originNameList.get(i).indexOf(".")));
		}
		
		
		if(code.equals("S")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/studio");
		}else if(code.equals("D")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/dress");
		}else if(code.equals("M")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/makeup");
		}else if(code.equals("H")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/hall");
		}else if(code.equals("B")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/goods");
		}else if(code.equals("I")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/goods");
		}
		
		

		System.out.println(savePath);

		ArrayList<String> filePathList = new ArrayList<String>();
		ArrayList<String> fullPathList = new ArrayList<String>();
		for(int i=0;i<filenameList.size();i++) {
			filePathList.add(onlyFileNameList.get(i)+"_"+time1+extensionList.get(i));
			fullPathList.add(savePath+"/"+filePathList.get(i));
		}
		for(int i=0;i<filenameList.size();i++) {
			if(!filenameList.get(i).isEmpty()) {
				try {
					byte[] bytes = filenameList.get(i).getBytes();
					File f = new File(fullPathList.get(i));
					FileOutputStream fos = new FileOutputStream(f);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
	
		ArrayList<Gallery> gList = new ArrayList<Gallery>();
		for(int i=0;i<filenameList.size();i++) {
			Gallery g = new Gallery(Integer.parseInt(no), code, originNameList.get(i), filePathList.get(i));
			
			gList.add(g);
		}
		int result=memberService.addGall(gList);
		if(code.equals("B") || code.equals("I")) {
			return "/admin/goodsCarePage";
		}else {
			return "redirect:/companyDetailView.do?prdNo="+no+"&code="+code;
		}
	};
	
	
	@RequestMapping(value = "/myReservList.do")
	public String myReservListView(HttpSession session,Model model) {
		System.out.println("예약리스트페이지 온!");
		Member vo =(Member)session.getAttribute("member");	
		
		
		
		List<Reservation> list=memberService.getAllReservList(vo);
		
		ReservationComparator comp = new ReservationComparator();
		Collections.sort(list,comp);
		System.out.println("정렬되었는지확인!");
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		
		Map<String, ArrayList<Reservation>> reservMap = new HashMap<String, ArrayList<Reservation>>();

		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0; i<list.size(); i++) {
			String word=format.format(list.get(i).getWeddingDate());
			System.out.println("키값은"+word);
			
			Boolean b= true;
			Iterator<Map.Entry<String, ArrayList<Reservation>>> entrie = reservMap.entrySet().iterator();
		
			while(entrie.hasNext()) {
				Entry<String, ArrayList<Reservation>> entry =(Entry<String, ArrayList<Reservation>>)entrie.next();
				if(entry.getKey().equals(word)) {
					reservMap.get(word).add(list.get(i));
					 System.out.println(entry.getKey() + "=" + entry.getValue().get(0));
					 System.out.println(i);
					b=false;
				}
			}
			if(b) {
				ArrayList<Reservation> rese = new ArrayList<Reservation>();
				rese.add(list.get(i));
				reservMap.put(word, rese);
				 System.out.println(i);
			}
		}
		
	
	
		model.addAttribute("resMap",reservMap);
		
		return "member/myReservList";
	}
	
	@RequestMapping(value = "/companyReservation.do")
	public String CompanyReservation(HttpSession session,Model model) {
		Member vo =(Member)session.getAttribute("member");
		System.out.println("업체 예약리스트확인");
		 List<Reservation> list = memberService.getReservationList(vo);
		
		 Map<String, ArrayList<Reservation>> reservMap = new HashMap<String, ArrayList<Reservation>>();
	
		 System.out.println("reservaion디비 접근후");
		 
		 if(list.isEmpty()) {
			 System.out.println("없는뎁쇼");
		 }else {
			 
		
		 System.out.println(list.get(0).getPrdName());

		 for(int i=0; i<list.size(); i++) {
			String word=list.get(i).getCode();
			System.out.println(list.get(i));
			Boolean b= true;
			
			Iterator<Map.Entry<String, ArrayList<Reservation>>> entries = reservMap.entrySet().iterator();
			System.out.println(entries.hasNext());
			
			while(entries.hasNext()) {
					Entry<String, ArrayList<Reservation>> entry =(Entry<String, ArrayList<Reservation>>)entries.next();
					b=true;
					System.out.println("여긴 왜안오냐");
				
					if(entry.getKey().equals(word)) {
						reservMap.get(word).add(list.get(i));
						 System.out.println(entry.getKey() + "=" + entry.getValue().get(0));
						 System.out.println(i);
						b=false;
					}
					
			 }
			if(b) {
				ArrayList<Reservation> rese = new ArrayList<Reservation>();
				rese.add(list.get(i));
				reservMap.put(word, rese);
				 System.out.println(i);
			}
		 }	
		 
		 model.addAttribute("resMap",reservMap);
		 }
		 return "member/companyReservation";
		 

	}
	
	@RequestMapping(value = "/weddingCollection.do")
	public String WeddingCollection(HttpSession session, Model model) {
	
		Member vo =(Member)session.getAttribute("member");
		
		ArrayList<Studio> sList = new ArrayList<Studio>();
		ArrayList<Dress> dList = new ArrayList<Dress>();
		ArrayList<Makeup> mList = new ArrayList<Makeup>();
		List<Scrapbook> list= memberService.getCollectionlist(vo);
		
		for(int i=0; i<list.size();i++) {
			if(list.get(i).getCode().equals("S")) {
				Studio s=memberService.getStudioScrapList(list.get(i).getPrdNo());
				System.out.println(s);
				sList.add(s);
			}else if(list.get(i).getCode().equals("D")){
				Dress d=memberService.getDressScrapList(list.get(i).getPrdNo());
				System.out.println(d);
				dList.add(d);
			}else if(list.get(i).getCode().equals("M")) {
				Makeup m = memberService.getMakeupList(list.get(i).getPrdNo());
				System.out.println(m);
				mList.add(m);
			}
		}
		
		SDMList sdmList = new SDMList(sList, dList, mList);
		model.addAttribute("sdmList",sdmList);
		
		return "member/weddingColleciton";
	}
	
	@RequestMapping(value = "/weddingHall.do")
	public String weddingHall(HttpSession session, Model model) {
		
		Member vo =(Member)session.getAttribute("member");
		
		ArrayList<Hall> hList = new ArrayList<Hall>();
		List<Scrapbook> list= memberService.getCollectionlist(vo);
		
		for(int i=0; i<list.size();i++) {
			if(list.get(i).getCode().equals("H")) {
				Hall h=memberService.getHallScrapList(list.get(i).getPrdNo());
				System.out.println(h);
				hList.add(h);

		}

		model.addAttribute("hallList",hList);
		
		
		
		}
		return "member/weddingHall";
	}
	
	@RequestMapping(value = "/oneTimelogin.do")
	public String oneTimeLogin(@RequestParam String number,Model model,HttpServletRequest request) {
		System.out.println("로그인 호출");
		

		System.out.println(number);
			
		
		String id="";
		System.out.println(id);
		
		String memberId = memberService.getMemberId(number);
		
		Member member = memberService.selectOneMemberEasy(memberId);
		HttpSession session = request.getSession(); 		
		String view = "";
		
		
		if(member!=null) {
			memberService.deleteEasyNumber(memberId);
			
			session.setAttribute("member", member);
			System.out.println(member);
			System.out.println("로그인성공");
			return "redirect:/";
		}else {
			model.addAttribute("msg", "아이디 , 패스워드를 확인해 주세요");
			model.addAttribute("loc", "loginPage.do");
			view = "common/msg";
			System.out.println("로그인실패");
		}
		return view;
	}
	
	
	@RequestMapping(value = "/login.do")
	public String memberLogin(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw,Model model) {
		System.out.println("로그인 호출");
		Member memberSet = new Member();
		memberSet.setMemberId(memberId);
		memberSet.setMemberPw(memberPw);
		Member member = memberService.selectOneMember(memberSet);
		HttpSession session = request.getSession(); 		
		String view = "";
		
		
		if(member!=null) {
			session.setAttribute("member", member);
			System.out.println(member);
			System.out.println("로그인성공");
			return "redirect:/";
		}else {
			model.addAttribute("msg", "아이디 , 패스워드를 확인해 주세요");
			model.addAttribute("loc", "loginPage.do");
			view = "common/msg";
			System.out.println("로그인실패");
		}
		return view;
	}
	
	@RequestMapping(value = "/loginPage.do")
	public String MemberLogin() {
		System.out.println("로그인페이지 호출");
	
		return "member/loginPage";
	}
	
	@RequestMapping(value = "/memberUpdate.do")
	public String MemberUpdate() {
		System.out.println("회원계정관리");
	
		return "member/memberUpdate";
	}
	@RequestMapping(value = "/memberUpdateEnroll.do")
	public String MemberUpdateEnroll(MemberEnroll vos, HttpSession session) {
		System.out.println("회원정보수정");
		System.out.println(vos);
		Member vosession =(Member)session.getAttribute("member");	
		String addr= vos.getJibunAddr()+"/"+
					vos.getExtraAddr()+"/"+
					vos.getDetailAddr()+"/"+
					vos.getPostNum()+"/"+
					vos.getRoadAddr();
		String phone=vos.getfPhone()+"/"+
					vos.getsPhone()+"/"+
					vos.gettPhone();
		
		System.out.println(addr);
		Member vo = new Member();
		vo.setAddr(addr);
		vo.setPhone(phone);
		vo.setBirthDay(vos.getBirthDay());
		vo.setEmail(vos.getEmail());
		vo.setMemberId(vos.getMemberId());
		vo.setMemberName(vos.getMemberName());
		vo.setMemberPw(vos.getMemberPw());
		vo.setMarrySchedule(vos.getMarrySchedule());
		vo.setExpectVisitor(vos.getExpectVisitor());
		vo.setBudget(vos.getBudget());
		vo.setEnrollDate(vosession.getEnrollDate());
		vo.setMemberCode(vosession.getMemberCode());
		
		
		
		int result = memberService.updateMember(vo);
		if(result>0) {
			session.setAttribute("member", vo);
		}
		
		
		return "redirect:/mypage.do";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null&&(Member)session.getAttribute("member")!=null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	

	@RequestMapping(value = "/enrollPage.do")
	public String enrollPage() {
		System.out.println("회원가입페이지 호출");
		return "member/enrollPage";
	}
	
	@RequestMapping(value = "/resultMyWeddingCost.do")
	public ModelAndView resultMyWeddingCost(HttpSession session) {
		System.out.println("웨딩비용계산결과를 가져가겠어요 오늘밤");
		ModelAndView mav = new ModelAndView();
		Member vo =(Member)session.getAttribute("member");	
		ArrayList<Simulator> s = (ArrayList<Simulator>) memberService.getSimulator(vo);
		
		mav.addObject("simulator",s);
		mav.setViewName("member/myWeddingCost");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailViewCost.do")
	public void detailViewCost(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("웨딩비용계산결과를 가져가겠어요 오늘밤2");
		String no = request.getParameter("no");
	
		System.out.println(no);
		//ModelAndView mav = new ModelAndView();
		
		response.setContentType("application/json; charset=utf-8");
		ArrayList<SimulatorSelect> ss = (ArrayList<SimulatorSelect>) memberService.getMyWeddingCost(Integer.parseInt(no));
		
		try {
			response.getWriter().println(new Gson().toJson(ss));
		} catch (IOException e) {
			e.printStackTrace();
		}
		//mav.addObject("simulatorSelect",ss);
		//mav.setViewName("member/myDetailViewCost");
		
	}
	
	
	@RequestMapping(value = "/memberEnroll.do")
	public String MemberEnroll(MemberEnroll vos) {
		System.out.println("회원가입로직시작");
		System.out.println(vos);

		String addr= vos.getJibunAddr()+"/"+
					vos.getExtraAddr()+"/"+
					vos.getDetailAddr()+"/"+
					vos.getPostNum()+"/"+
					vos.getRoadAddr();
		String phone=vos.getfPhone()+"/"+
					vos.getsPhone()+"/"+
					vos.gettPhone();
		Member vo = new Member();
		
		vo.setPhone(phone);
		vo.setAddr(addr);
		
		vo.setBirthDay(vos.getBirthDay());
		vo.setEmail(vos.getEmail());
		vo.setMemberId(vos.getMemberId());
		vo.setMemberName(vos.getMemberName());
		vo.setMemberPw(vos.getMemberPw());
		
		
		int result = memberService.insertMember(vo);
		if(result>0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping(value = "/myCompanyPage.do")
	public String MyCompanyView(HttpSession session,Model model) {
		System.out.println("나의업체 관리페이지");
		Member vo =(Member)session.getAttribute("member");	
		ArrayList<Studio> ms= (ArrayList<Studio>) memberService.selectAllStudioMember(vo);
		ArrayList<Dress> md = (ArrayList<Dress>) memberService.selectAllDressMember(vo);
		ArrayList<Hall> mh = (ArrayList<Hall>) memberService.selectAllHallMember(vo);
		ArrayList<Makeup> mm = (ArrayList<Makeup>) memberService.selectAllMakeupMember(vo);	
		MemberAll ma = new MemberAll(md,ms,mm,mh);
		
		System.out.println(ms);
		System.out.println(md);
		System.out.println(mh);
		System.out.println(mm);
		
			
		model.addAttribute("memberAll",ma);
		
		return "member/myCompanyPage";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String myPageView(HttpSession session,Model model) {
		System.out.println("마이페이지 호출");
		
		Member vo =(Member)session.getAttribute("member");	
		
		model.addAttribute("member",vo);
		
		
		return "member/mypage";
	}
	
	@RequestMapping(value = "/memberDelete.do")

	public String MemberDelete(HttpServletRequest request , Model model) {
		System.out.println("탈퇴 호출");
		String id = request.getParameter("memberId");
		System.out.println(id);
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			session.invalidate();
		}
		model.addAttribute("msg", "회원탈퇴 되었습니다.");
		model.addAttribute("loc", "");
		memberService.deleteMember(id);
		return "common/msg";
	}
	
	@RequestMapping(value = "/goAddTerms.do")
	public String GoMemberTerms() {
		System.out.println("회원등록 약관 호출");

		return "member/addMemberTerms";
	}
	
	@RequestMapping(value = "/goCompanyTerms.do")
	public String GoCompanyTerms() {
		System.out.println("회원등록 약관 호출");

		return "member/addCompanyTerms";
	}
	
	@RequestMapping(value = "/deleteStudioOption.do")
	@ResponseBody
	public int deleteStudioOption(@RequestParam int type,@RequestParam int no) {
		System.out.println("스튜디오옵션삭제시작");

		int result=memberService.deleteStudioOption(no,type);
		if(result>0) {
			System.out.println("삭제성공");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/deleteOneStudioOption.do")
	@ResponseBody
	public int deleteStudioOption(@RequestParam int optionNo) {
		System.out.println("스튜디오옵션삭제시작");

		int result=memberService.deleteOneStudioOption(optionNo);
		if(result>0) {
			System.out.println("삭제성공");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/updateOneStudioOption.do")
	@ResponseBody
	public int updateOneStudioOption(@RequestParam String option,@RequestParam String price,@RequestParam int optionNo) {
		System.out.println("스튜디오옵션수정시작");

		System.out.println(option+price+optionNo);
		int result=memberService.updateOneStudioOption(optionNo,option,price);
		if(result>0) {
			System.out.println("수정성공");
		}
		
		return result;
	}
	


	
	@RequestMapping(value = "/enrollCompanyPage.do")
	public String GoCompanyEnrollPage() {
		System.out.println("업체등록페이지");

		return "member/addCompany";
	}
	
	@RequestMapping(value = "/insertGallery.do")
	public String insertGallery(HttpServletRequest request,Model model) {
		System.out.println("갤러리록페이지");
		String code=request.getParameter("code");
		String no=request.getParameter("no");

		ArrayList<Gallery> list = (ArrayList<Gallery>) memberService.getGalleryList(no,code);
		model.addAttribute("gallList", list);
		
		return "member/controllGallery";
	}
	
	@RequestMapping(value = "/studioOptionAdd.do")
	public String studioOptionAdd(HttpServletRequest request) {
		System.out.println("스튜디오옵션등록페이지");
		String price=request.getParameter("studioOptionPrice");
		System.out.println(price);
		String type=request.getParameter("studioOptionType");
		System.out.println(type);
		String no=request.getParameter("studioNo");
		System.out.println(no);
		String name=request.getParameter("studioOption");
		System.out.println(name);
		
		StudioSelect ss =new StudioSelect(0,Integer.parseInt(no), name, Integer.parseInt(price), Integer.parseInt(type));
		
		int result=memberService.addStudioOption(ss);
		
		
		return "redirect:/companyDetailView.do?prdNo="+no+"&code=S";
	}
	
	@RequestMapping(value = "/companyDetailView.do")
	public ModelAndView companyDetailView(Model model,HttpServletRequest request) {
		System.out.println("업체상세페이지");
		ModelAndView mav = new ModelAndView();
		int no=Integer.parseInt(request.getParameter("prdNo"));
		String code=request.getParameter("code");
		
		if(code.equals("S")) {
		
			
			mav.addObject("studio", memberService.selectOneStudioNumber(no));
			mav.addObject("studioSelectList0", memberService.selectListStudioOptionNumber(no, 0));
			mav.addObject("studioSelectList1", memberService.selectListStudioOptionNumber(no, 1));
			mav.addObject("studioSelectList2", memberService.selectListStudioOptionNumber(no, 2));
			mav.addObject("galleryList", memberService.selectListGalleryNumber(no, "S"));
			
			mav.setViewName("member/companyDetailStudio");
			return mav;
			
		}else if(code.equals("D")) {
		
			mav.addObject("dress", memberService.selectOneDressNumber(no));
			mav.addObject("galleryList", memberService.selectListGalleryNumber(no, "D"));
			mav.setViewName("member/companyDetailDress");
			return mav;
		}else if(code.equals("M")){
	
			mav.addObject("makeup", memberService.selectOneMakeupNumber(no));
			mav.addObject("galleryList", memberService.selectListGalleryNumber(no, "M"));
			mav.setViewName("member/companyDetailMakeup");
			return mav;
		}else if(code.equals("H")){
			
			// 아직 홀 진행중	
			mav.addObject("hall", memberService.selectOneHallNumber(no));
			mav.addObject("galleryList", memberService.selectListGalleryNumber(no, "H"));
			mav.setViewName("member/companyDetailHall");
			return mav;
		}	
		return mav;	
	}
	



	@RequestMapping(value = "/companyEnroll.do" , method = RequestMethod.POST)
	public String companyEnroll(
			CompanyInfo ci,
			HttpSession session,
			@RequestParam(value="studioOption",required = true) List<String> studioOption,
			@RequestParam(value="studioOptionPrice",required = true) List<Integer> studioOptionPrice,
			@RequestParam(value="studioOptionType",required = true) List<Integer> studioOptionType,
			@RequestParam(value="hallSelectPrice",required = true) List<Integer> hallSelectPrice,
			@RequestParam(value="hallSelectName",required = true) List<String> hallSelectName,
			@RequestParam(value="hallSelectPerson",required = true) List<String> hallSelectPeople,
			@RequestParam(value="hallSelectTime",required = true) List<String> hallSelectTime,
			@RequestParam(value="hallSelectEtc",required = true) List<String> hallSelectEtc,
			HttpServletRequest request,
			@RequestParam MultipartFile fileName
			){
		String phone=ci.getfPhone()+"/"+ci.getsPhone()+"/"+ci.gettPhone();
		ci.setCompanyPhone(phone);
		System.out.println("업체등록 로직 시작");
		System.out.println("컨트롤러"+ci);
		String code=ci.getCode();
		int seqNo=0;
		Member vo =(Member)session.getAttribute("member");	
		HallSelectList hsl=new HallSelectList();
		StudioSelectList ssl = new StudioSelectList();
		ArrayList<StudioSelect> list = new ArrayList<StudioSelect>();
		ArrayList<HallSelect> list2= new ArrayList<HallSelect>();
	
		String savePath="";
		
		String originName=fileName.getOriginalFilename();
		String onlyFileName=originName.substring(0,originName.indexOf("."));
		String extension= originName.substring(originName.indexOf("."));
		
		if(code.equals("S")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/studio");
		}else if(code.equals("D")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/dress");
		}else if(code.equals("M")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/makeup");
		}else if(code.equals("H")) {
			savePath = request.getSession().getServletContext().getRealPath("/resources/hall");
		}
		System.out.println(savePath);

		String filePath = onlyFileName+"_"+"1"+extension;
		String fullPath = savePath +"/"+filePath;
		
		if(!fileName.isEmpty()) {
			try {
				byte[] bytes = fileName.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		ci.setFileNames(originName);
		ci.setFilePath(filePath);
		System.out.println(originName+"//"+filePath);
		
		
		int result=0;
		int result2=0;

		 String fullAddr=ci.getJibunAddr()+"/"+
			ci.getExtraAddr()+"/"+
			ci.getDetailAddr()+"/"+
			ci.getPostNum()+"/"+
			ci.getRoadAddr();
		
		 ci.setCompanyAddr(fullAddr);
		
		if(code.equals("S")) {
			result=memberService.insertStudio(ci, vo);
			if(result>0) {
				seqNo=memberService.getStudioNo(ci.getCompanyName(),vo.getMemberId());
				System.out.println(seqNo);
				for(int i=0; i<studioOption.size(); i++) {
					StudioSelect ss = new StudioSelect(0,seqNo, studioOption.get(i),studioOptionPrice.get(i), studioOptionType.get(i));
					list.add(ss);
				}
				ssl.setList(list);
				result2=memberService.insertStudioOption(ssl);
			}
		}else if(code.equals("D")) {
			result= memberService.insertDress(ci, vo);
		}else if(code.equals("M")) {
			result= memberService.insertMakeup(ci, vo);
		}else if(code.equals("H")) {
			
			result=memberService.insertHall(ci, vo);
			if(result>0) {
				seqNo=memberService.getHallNo(ci.getCompanyName(),vo.getMemberId());
				for(int i=0; i<hallSelectPrice.size(); i++) {
					HallSelect  hs = new HallSelect(seqNo,hallSelectName.get(i)+"/"+hallSelectPeople.get(i)+"/"+hallSelectTime,seqNo,hallSelectPrice.get(i),hallSelectEtc.get(i));
		
					list2.add(hs);
				}
				hsl.setList(list2);
				result2=memberService.insertHallOption(hsl);
			}
		}	
		
		if(result>0 && code.equals("S") && result2>0){
			return "redirect:/index.jsp";
		}else if(result>0 && code.equals("H") && result2>0) {
			return "redirect:/index.jsp";
		}else if(result>0){
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
	}
}
