package kr.co.collection.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.collection.model.service.CollectionService;
import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.SearchPageData;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;
import kr.co.scrapbook.model.vo.Scrapbook;

@Controller
public class CollectionController {
	@Autowired
	@Qualifier(value="collectionService")
	private CollectionService collectionService;

	@RequestMapping("/collectionList.do")
	public String collectionList(HttpServletRequest request, String code){
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}		
		if(code != null) {
			if(code.equals("all")) {
				return "redirect:/collectionListAll.do?reqPage="+reqPage;
			}else if(code.equals("S")) {
				return "redirect:/collectionListStudio.do?reqPage="+reqPage;
			}else if(code.equals("D")) {
				return "redirect:/collectionListDress.do?reqPage="+reqPage;
			}else if(code.equals("M")) {
				return "redirect:/collectionListMakeup.do?reqPage="+reqPage;
			}else if(code.equals("B")) {
				return "redirect:/collectionListBouquet.do?reqPage="+reqPage;
			}else if(code.equals("I")) {
				return "redirect:/collectionListInvitation.do?reqPage="+reqPage;
			}
			return "redirect:/collectionListAll.do?reqPage="+reqPage;
		}else {
			return "redirect:/collectionListAll.do?reqPage="+reqPage;			
		}
	}
	
	@RequestMapping("/collectionListAll.do")
	public ModelAndView collectionListAll(int reqPage) {
		AllPageData pd = collectionService.pageAllList(reqPage);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionAllList");
		return mav;
	}
	
	@RequestMapping("/collectionListStudio.do")
	public ModelAndView collectionListStudio(HttpSession session, @RequestParam int reqPage) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		AllPageData pd = collectionService.pageStudioList(reqPage, memberId);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	
	@RequestMapping("/collectionListDress.do")
	public ModelAndView collectionListDress(HttpSession session, @RequestParam int reqPage) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		AllPageData pd = collectionService.pageDressList(reqPage, memberId);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	
	@RequestMapping("/collectionListMakeup.do")
	public ModelAndView collectionListMakeup(HttpSession session, @RequestParam int reqPage) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		AllPageData pd = collectionService.pageMakeupList(reqPage, memberId);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	
	@RequestMapping("/collectionListBouquet.do")
	public ModelAndView collectionListBouquet(HttpSession session, @RequestParam int reqPage) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		AllPageData pd = collectionService.pageBouquetList(reqPage, memberId);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}

	@RequestMapping("/collectionListInvitation.do")
	public ModelAndView collectionListInvitation(HttpSession session, @RequestParam int reqPage) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		AllPageData pd = collectionService.pageInvitationList(reqPage, memberId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	
	//태그 클릭
	@RequestMapping("/collectionListTagSearch.do")
	public ModelAndView collectionTagSearchList(HttpServletRequest request, HttpSession session, @RequestParam String keyword) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}		
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		SearchPageData pd = collectionService.pageTagSearchList(reqPage, keyword, memberId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd", pd);
		mav.addObject("keyword", keyword);
		mav.setViewName("collection/collectionListSearch");
		return mav;
	}
	
	//검색창에서 검색
	@RequestMapping("/collectionSearch.do")
	public ModelAndView collectionSearchList(HttpServletRequest request, HttpSession session, @RequestParam String keyword, @RequestParam String searchAddr, @RequestParam String searchCode) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch(NumberFormatException e) {
			reqPage = 1;
		}
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
		}
		SearchPageData pd = collectionService.pageSearchList(reqPage, keyword, searchAddr, searchCode, memberId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd", pd);
		mav.addObject("keyword", keyword);
		mav.setViewName("collection/collectionListSearch");
		return mav;
	}

	
	@RequestMapping("/collectionView.do")
	public String collectionView(String code, int objectNo) {
		if(code != null) {
			if(code.equals("S")) {
				return "redirect:/collectionViewStudio.do?studioNo="+objectNo;
			}else if(code.equals("D")) {
				return "redirect:/collectionViewDress.do?dressNo="+objectNo;
			}else if(code.equals("M")) {
				return "redirect:/collectionViewMakeup.do?makeupNo="+objectNo;
			}else if(code.equals("B") || code.equals("I")) {
				return "redirect:/collectionViewGoods.do?goodsType="+code+"&goodsNo="+objectNo;
			}
			return "redirect:/collectionListAll.do?reqPage=1";
		}else {
			return "redirect:/collectionListAll.do?reqPage=1";
		}
	}
	
	@RequestMapping("/collectionViewStudio.do")
	public ModelAndView collectionViewStudio(HttpSession session, @RequestParam int studioNo) {
		Member m = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("studio", collectionService.selectOneStudio(studioNo));
		mav.addObject("studioSelectList0", collectionService.selectListStudioOption(studioNo, 0));
		mav.addObject("studioSelectList1", collectionService.selectListStudioOption(studioNo, 1));
		mav.addObject("studioSelectList2", collectionService.selectListStudioOption(studioNo, 2));
		mav.addObject("galleryList", collectionService.selectListGallery(studioNo, "S"));
		mav.addObject("reviewList", collectionService.selectListReview(studioNo, "S"));
		if(m != null) {
			Scrapbook scrap = collectionService.selectOneScrapbook(m.getMemberId(), studioNo, "S");
			mav.addObject("scrapbook", scrap);
		}
		mav.setViewName("collection/collectionViewStudio");
		return mav;
	}
	
	@RequestMapping("/collectionViewDress.do")
	public ModelAndView collectionViewDress(HttpSession session, @RequestParam int dressNo) {
		Member m = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("dress", collectionService.selectOneDress(dressNo));
		mav.addObject("galleryList", collectionService.selectListGallery(dressNo, "D"));
		mav.addObject("reviewList", collectionService.selectListReview(dressNo, "D"));
		if(m != null) {
			Scrapbook scrap = collectionService.selectOneScrapbook(m.getMemberId(), dressNo, "D");
			mav.addObject("scrapbook", scrap);			
		}
		mav.setViewName("collection/collectionViewDress");
		return mav;
	}
	
	@RequestMapping("/collectionViewMakeup.do")
	public ModelAndView collectionViewMakeup(HttpSession session, @RequestParam int makeupNo) {
		Member m = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("makeup", collectionService.selectOneMakeup(makeupNo));
		mav.addObject("galleryList", collectionService.selectListGallery(makeupNo, "M"));
		mav.addObject("reviewList", collectionService.selectListReview(makeupNo, "M"));
		if(m != null) {
			Scrapbook scrap = collectionService.selectOneScrapbook(m.getMemberId(), makeupNo, "M");
			mav.addObject("scrapbook", scrap);
		}
		mav.setViewName("collection/collectionViewMakeup");
		return mav;		
	}
	
	@RequestMapping("/collectionViewGoods.do")
	public ModelAndView collectionViewGoods(HttpSession session, @RequestParam String goodsType, @RequestParam int goodsNo) {
		Member m = (Member)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("goods", collectionService.selectOneGoods(goodsNo));
		mav.addObject("galleryList", collectionService.selectListGallery(goodsNo, "G"));
		mav.addObject("reviewList", collectionService.selectListReview(goodsNo, "G"));
		if(m != null) {
			Scrapbook scrap = collectionService.selectOneScrapbook(m.getMemberId(), goodsNo, "G");
			mav.addObject("scrapbook", scrap);
		}
		if(goodsType.equals("B")) {
			mav.setViewName("collection/collectionViewBouquet");
		}else if(goodsType.equals("I")) {
			mav.setViewName("collection/collectionViewInvitation");
		}else {
			mav.setViewName("collection/collectionList");
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/scrapOn.do")
	public int insertOneScrap(HttpSession session, @RequestParam int objectNo, @RequestParam String code) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
			String prdName = null;
			String prdFilepath = null;
			if(code.equals("S")) {
				prdName = collectionService.selectOneStudio(objectNo).getStudioName();
				prdFilepath = collectionService.selectOneStudio(objectNo).getStudioFilepath();
			}else if(code.equals("D")) {
				prdName = collectionService.selectOneDress(objectNo).getDressName();
				prdFilepath = collectionService.selectOneDress(objectNo).getDressFilepath();
			}else if(code.equals("M")) {
				prdName = collectionService.selectOneMakeup(objectNo).getMakeupName();
				prdFilepath = collectionService.selectOneMakeup(objectNo).getMakeupFilepath();
			}else if(code.equals("G")) {
				prdName = collectionService.selectOneGoods(objectNo).getGoodsName();
				prdFilepath = collectionService.selectOneGoods(objectNo).getGoodsFilePath();
			}
			return collectionService.insertOneScrap(objectNo, code, memberId, prdName, prdFilepath);
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping("/scrapOff.do")
	public int deleteOneScrap(HttpSession session, @RequestParam int objectNo, @RequestParam String code) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
			return collectionService.deleteOneScrap(objectNo, code, memberId);
		}else {
			return 0;
		}
	}

	@RequestMapping("/editor.do")
	public String editorOpen(HttpSession session, @RequestParam String code) {
		Member m = (Member) session.getAttribute("member");
		String memberId = null;
		if(m != null) {
			memberId = m.getMemberId();
			if(memberId.equals("admin")) {
				return "editor/editor";				
			}else {
				return "editor/editorFailed";
			}
		}else {
			return "editor/editorFailed";
		}
	}
	
	@ResponseBody
	@RequestMapping("/reservationStudio.do")
	public int insertReservationStudio(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdId, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam String option1, @RequestParam String option2, @RequestParam String option2Date, @RequestParam String option2Time, @RequestParam String option3) {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		if(m != null) {
			vo = new Reservation();
			vo.setCode(code);
			vo.setPrdNo(prdNo);
			vo.setPrdId(prdId);
			vo.setPrdName(prdName);
			vo.setWeddingTime(weddingTime);
			vo.setTotalPrice(totalPrice);
			vo.setMemberId(m.getMemberId());
			vo.setMemberName(m.getMemberName());
			vo.setMemberPhone(m.getPhone());
			vo.setMemberEmail(m.getEmail());
			vo.setOption1(option1);
			vo.setOption2(option2);
			vo.setOption2Time(option2Time);
			vo.setOption3(option3);
			int result = collectionService.insertReservationStudio(vo,weddingDate,option2Date);
			if(result > 0) {
				result = collectionService.selectReservationNo(m.getMemberId());
				return result;
			}else {
				return result;				
			}
		}else {
			return -1;
		}
	}
	
	@ResponseBody
	@RequestMapping("/reservationDress.do")
	public int insertReservationDress(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdId, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam String option1, @RequestParam String option1Date, @RequestParam String option1Time, @RequestParam String option2, @RequestParam int option2Amount, @RequestParam String option3) throws ParseException {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		if(m != null) {
			vo = new Reservation();
			vo.setCode(code);
			vo.setPrdNo(prdNo);
			vo.setPrdId(prdId);
			vo.setPrdName(prdName);
			vo.setWeddingTime(weddingTime);
			vo.setTotalPrice(totalPrice);
			vo.setMemberId(m.getMemberId());
			vo.setMemberName(m.getMemberName());
			vo.setMemberPhone(m.getPhone());
			vo.setMemberEmail(m.getEmail());
			vo.setOption1(option1);
			vo.setOption1Time(option1Time);
			vo.setOption2(option2);
			vo.setAmount(option2Amount);
			vo.setOption3(option3);
			int result = collectionService.insertReservationDress(vo,weddingDate,option1Date);
			if(result > 0) {
				result = collectionService.selectReservationNo(m.getMemberId());
				return result;
			}else {
				return result;
			}
		}else {
			return -1;
		}
	}
	
	@ResponseBody
	@RequestMapping("/reservationMakeup.do")
	public int insertReservationMakeup(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdId, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam String option1, @RequestParam String option2, @RequestParam String option3) {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		if(m != null) {
			vo = new Reservation();
			vo.setCode(code);
			vo.setPrdNo(prdNo);
			vo.setPrdId(prdId);
			vo.setPrdName(prdName);
			vo.setWeddingTime(weddingTime);
			vo.setTotalPrice(totalPrice);
			vo.setMemberId(m.getMemberId());
			vo.setMemberName(m.getMemberName());
			vo.setMemberPhone(m.getPhone());
			vo.setMemberEmail(m.getEmail());
			vo.setOption1(option1);
			vo.setOption2(option2);
			vo.setOption3(option3);
			int result = collectionService.insertReservationMakeup(vo,weddingDate);
			if(result > 0) {
				result = collectionService.selectReservationNo(m.getMemberId());
				return result;
			}else {
				return result;
			}
		}else {
			return -1;
		}
	}
	
	@RequestMapping("/reservationGoods.do")
	public String insertReservationGoods(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam String memberId, @RequestParam String memberName, @RequestParam String memberPhone, @RequestParam String memberEmail, @RequestParam String payMethod, @RequestParam int amount, @RequestParam String orderMemo, @RequestParam String orderAddr, @RequestParam String receiveName, @RequestParam String receivePhone, @RequestParam String bankName, @RequestParam String bankNum, @RequestParam String bankHolder, @RequestParam String bankDate, @RequestParam String impUid, @RequestParam int applyNum, @RequestParam String paymentDate) {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		vo = new Reservation();
		vo.setCode(code);
		vo.setPrdNo(prdNo);
		vo.setPrdName(prdName);
		vo.setWeddingTime(weddingTime);
		vo.setTotalPrice(totalPrice);
		vo.setMemberId(memberId);
		vo.setMemberName(memberName);
		vo.setMemberPhone(memberPhone);
		vo.setMemberEmail(memberEmail);
		vo.setPayMethod(payMethod);
		vo.setAmount(amount);
		vo.setOrderMemo(orderMemo.replace("<","&lt;").replace(">", "&gt;").replace(" ", "&nbsp;").replace("\"","&quot;").replace("\r\n", "<br>"));
		vo.setOrderAddr(orderAddr);
		vo.setReceiveName(receiveName);
		vo.setReceivePhone(receivePhone);
		vo.setBankName(bankName);
		vo.setBankNum(bankNum);
		vo.setBankHolder(bankHolder);
		vo.setBankDate(bankDate);
		vo.setImpUid(impUid);
		vo.setApplyNum(applyNum);
		vo.setPaymentDate(paymentDate);
		int result = collectionService.insertReservationGoods(vo,weddingDate);
		if(m != null) {
			if(result > 0) {
				result = collectionService.selectReservationNo(m.getMemberId());
				return "redirect:/reservationView.do?memberId="+m.getMemberId()+"&reservationNo="+result;
			}else {
				return "redirect:/index.jsp";
			}
		}else {
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping("/paymentPage.do")
	public ModelAndView personallInformationPage(HttpSession session, @RequestParam String code, @RequestParam int prdNo, @RequestParam String prdName, @RequestParam String weddingDate, @RequestParam String weddingTime, @RequestParam int totalPrice, @RequestParam String payMethod, @RequestParam int amount, @RequestParam String orderMemo, @RequestParam String orderAddr, @RequestParam String receiveName, @RequestParam String receivePhone) {
		Member m = (Member) session.getAttribute("member");
		Reservation vo = null;
		ModelAndView mav = new ModelAndView();
		if(m != null) {
			vo = new Reservation();
			vo.setCode(code);
			vo.setPrdNo(prdNo);
			vo.setPrdName(prdName);
			vo.setWeddingTime(weddingTime);
			vo.setTotalPrice(totalPrice);
			vo.setMemberId(m.getMemberId());
			vo.setMemberName(m.getMemberName());
			vo.setMemberPhone(m.getPhone());
			vo.setMemberEmail(m.getEmail());
			vo.setPayMethod(payMethod);
			vo.setAmount(amount);
			vo.setOrderMemo(orderMemo.replace("<","&lt;").replace(">", "&gt;").replace(" ", "&nbsp;").replace("\"","&quot;").replace("\r\n", "<br>"));
			vo.setOrderAddr(orderAddr);
			vo.setReceiveName(receiveName);
			vo.setReceivePhone(receivePhone);
			mav.addObject("reservation", vo);
			mav.addObject("weddingDate", weddingDate);
			mav.setViewName("payment/paymentPage");
			return mav;
		}else {
			mav.setViewName("member/loginPage");
			return mav;
		}
	}
	
}
