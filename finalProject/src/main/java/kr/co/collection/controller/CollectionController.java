package kr.co.collection.controller;

import java.util.ArrayList;

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
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;
import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

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
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
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
	public ModelAndView collectionViewStudio(int studioNo) {
		Studio s = collectionService.selectOneStudio(studioNo);
		ArrayList<StudioSelect> ssList = collectionService.selectListStudioOption(studioNo);
		ArrayList<Gallery> gList = collectionService.selectListGallery(studioNo, "S");
		ModelAndView mav = new ModelAndView();
		mav.addObject("studio", s);
		mav.addObject("studioSelectList", ssList);
		mav.addObject("galleryList", gList);
		mav.setViewName("collection/collectionViewStudio");
		return mav;
	}
	
	@RequestMapping("/collectionViewDress.do")
	public ModelAndView collectionViewDress(int dressNo) {
		Dress d = collectionService.selectOneDress(dressNo);
		ArrayList<Gallery> gList = collectionService.selectListGallery(dressNo, "D");
		ModelAndView mav = new ModelAndView();
		mav.addObject("dress", d);
		mav.addObject("galleryList", gList);
		mav.setViewName("collection/collectionViewDress");
		return mav;
	}
	
	@RequestMapping("/collectionViewMakeup.do")
	public ModelAndView collectionViewMakeup(int makeupNo) {
		Makeup m = collectionService.selectOneMakeup(makeupNo);
		ArrayList<Gallery> gList = collectionService.selectListGallery(makeupNo, "M");
		ModelAndView mav = new ModelAndView();
		mav.addObject("makeup", m);
		mav.addObject("galleryList", gList);
		mav.setViewName("collection/collectionViewDress");
		return mav;		
	}
	
	@RequestMapping("/collectionViewGoods.do")
	public ModelAndView collectionViewGoods(String goodsType, int goodsNo) {
		Goods g = collectionService.selectOneGoods(goodsNo);
		ArrayList<Gallery> gList = collectionService.selectListGallery(goodsNo, "G");
		ModelAndView mav = new ModelAndView();
		mav.addObject("goods", g);
		mav.addObject("galleryList", gList);
		if(goodsType.equals("B")) {
			mav.setViewName("collection/collectionViewBouquet");
		}else {
			mav.setViewName("collection/collectionViewInvitation");
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
	
}
