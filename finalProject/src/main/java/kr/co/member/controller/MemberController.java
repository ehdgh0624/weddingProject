package kr.co.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Comparator;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.collection.model.vo.StudioSelectList;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelect;
import kr.co.hall.vo.HallSelectList;
import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.CompanyInfo;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.MemberAll;
import kr.co.member.model.vo.MemberEnroll;
import kr.co.reservation.model.vo.Reservation;
import kr.co.reservation.model.vo.ReservationComparator;



@Controller
public class MemberController {

	@Autowired
	@Qualifier(value="memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "/login.do")
	public String memberLogin(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw) {
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
			view = "member/loginFailed";
			System.out.println("로그인실패");
		}
		return view;
	}
	
	@RequestMapping(value = "/loginPage.do")
	public String memberLogin() {
		System.out.println("로그인페이지 호출");
	
		return "member/loginPage";
	}
	
	@RequestMapping(value = "/memberUpdate.do")
	public String memberUpdate() {
		System.out.println("회원계정관리");
	
		return "member/memberUpdate";
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
	
	@RequestMapping(value = "/memberEnroll.do")
	public String memberEnroll(MemberEnroll vos) {
		System.out.println("회원가입로직시작");
		System.out.println(vos);

		String addr= vos.getJibunAddr()+"//"+
					vos.getExtraAddr()+"//"+
					vos.getDetailAddr()+"//"+
					vos.getPostNum();
		
		Member vo = new Member();
		vo.setAddr(addr);
		vo.setBirthDay(vos.getBirthDay());
		vo.setEmail(vos.getEmail());
		vo.setMemberId(vos.getMemberId());
		vo.setMemberName(vos.getMemberName());
		vo.setMemberPw(vos.getMemberPw());
		vo.setPhone(vos.getPhone());
		
		
		int result = memberService.insertMember(vo);
		if(result>0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
	}
	@RequestMapping(value = "/myCompanyPage.do")
	public String myCompanyView(HttpSession session,Model model) {
		System.out.println("나의업체 관리페이지");
		Member vo =(Member)session.getAttribute("member");	
		Studio ms = memberService.selectOneStudioMember(vo);
		Dress md = memberService.selectOneDressMember(vo);
		Hall mh = memberService.selectOneHallMember(vo);
		Makeup mm = memberService.selctOneMakeupMember(vo);	
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
	//아직 적용안함
	@RequestMapping(value = "/goAddTerms.do")
	public String goMemberTerms() {
		System.out.println("회원등록 약관 호출");

		return "member/addMemberTerms";
	}
	
	@RequestMapping(value = "/goCompanyTerms.do")
	public String goCompanyTerms() {
		System.out.println("회원등록 약관 호출");

		return "member/addCompanyTerms";
	}
	
	@RequestMapping(value = "/enrollCompanyPage.do")
	public String goCompanyEnrollPage() {
		System.out.println("업체등록페이지");

		return "member/addCompany";
	}
	
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
			Iterator<Map.Entry<String, ArrayList<Reservation>>> entries = reservMap.entrySet().iterator();
			
			while(entries.hasNext()) {
				Entry<String, ArrayList<Reservation>> entry =(Entry<String, ArrayList<Reservation>>)entries.next();
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
		
//		Studio ms = memberService.selectOneStudioMember(vo);
//		Dress md = memberService.selectOneDressMember(vo);
//		Hall mh = memberService.selectOneHallMember(vo);
//		Makeup mm = memberService.selctOneMakeupMember(vo);	
//		MemberAll ma = new MemberAll(md,ms,mm,mh);

		return "member/myReservList";
	}

	@RequestMapping(value = "/companyEnroll.do")
	public String companyEnroll(
			CompanyInfo ci,
			HttpSession session,
			@RequestParam(value="studioOption",required = true) List<String> studioOption,
			@RequestParam(value="studioOptionPrice",required = true) List<Integer> studioOptionPrice,
			@RequestParam(value="studioOptionType",required = true) List<Integer> studioOptionType,
			@RequestParam(value="hallSelectType",required = true) List<String> hallSelectType,
			@RequestParam(value="hallSelectPrice",required = true) List<Integer> hallSelectPrice,
			@RequestParam(value="hallSelectName",required = true) List<String> hallSelectName,
			@RequestParam(value="hallSelectEtc",required = true) List<String> hallSelectEtc){
		System.out.println("업체등록 로직 시작");
		int seqNo=0;
		Member vo =(Member)session.getAttribute("member");	
		HallSelectList hsl=new HallSelectList();
		StudioSelectList ssl = new StudioSelectList();

		
		int result=0;
		int result2=0;

		
		
		int code=ci.getCode();
		
		if(code==0) {
			result=memberService.insertStudio(ci, vo);
			if(result>0) {
				seqNo=memberService.getStudioNo(ci.getCompanyName(),vo.getMemberId());
				for(int i=0; i<studioOption.size(); i++) {
					StudioSelect ss = new StudioSelect(seqNo, studioOption.get(i),studioOptionPrice.get(i), studioOptionType.get(i));
					ssl.getList().add(ss);
				}
				result2=memberService.insertStudioOption(ssl);
			}
		}else if(code==1) {
			result= memberService.insertDress(ci, vo);
		}else if(code==2) {
			result= memberService.insertMakeup(ci, vo);
		}else if(code==3) {
			result=memberService.insertHall(ci, vo);
			if(result>0) {
				seqNo=memberService.getHallNo(ci.getCompanyName(),vo.getMemberId());
				for(int i=0; i<hallSelectType.size(); i++) {
					HallSelect  hs = new HallSelect(seqNo,hallSelectType.get(i),hallSelectPrice.get(i),hallSelectEtc.get(i),hallSelectName.get(i));
					hsl.getList().add(hs);
				}
				result2=memberService.insertHallOption(hsl);
			}
		}	
		if(result>0 && code==0 && result2>0){
			return "redirect:/index.jsp";
		}else if(result>0 && code==3 && result2>0) {
			return "redirect:/index.jsp";
		}else if(result>0){
			return "redirect:/index.jsp";
		}else {
			return "redirect:/index.jsp";
		}
	}
}
