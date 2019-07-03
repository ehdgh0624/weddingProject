package kr.co.collection.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.collection.model.service.CollectionService;
import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;

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
		System.out.println("선택된 Collection 카테고리 : "+code);
		if(code != null) {
			if(code.equals("all")) {
				return "redirect:/collectionListAll.do?reqPage="+reqPage;
			}else if(code.equals("S")) {
				return "redirect:/collectionListStudio.do?reqPage="+reqPage;
			}else if(code.equals("D")) {
				return "redirect:/collectionListDress.do?reqPage="+reqPage;
			}else if(code.equals("M")) {
				return "redirect:/collectionListMakeup.do?reqPage="+reqPage;
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
	public ModelAndView collectionListStudio(int reqPage) {
		AllPageData pd = collectionService.pageStudioList(reqPage);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	@RequestMapping("/collectionListDress.do")
	public ModelAndView collectionListDress(int reqPage) {
		AllPageData pd = collectionService.pageDressList(reqPage);
		ModelAndView mav =  new ModelAndView();
		mav.addObject("pd", pd);
		mav.setViewName("collection/collectionList");
		return mav;
	}
	@RequestMapping("/collectionListMakeup.do")
	public ModelAndView collectionListMakeup(int reqPage) {
		AllPageData pd = collectionService.pageMakeupList(reqPage);
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
		ArrayList<Gallery> gList = collectionService.selectListStudioGallery(studioNo, "S");
		ModelAndView mav = new ModelAndView();
		System.out.println(s.getCode());
		System.out.println(ssList.get(0).getStudioOptionType());
		System.out.println(gList.get(0).getGalleryCode());
		return mav;
	}
	
	@RequestMapping("/collectionViewDress.do")
	public ModelAndView collectionViewDress(int dressNo) {
		ModelAndView mav = new ModelAndView();
		return mav;
		
	}
	
	@RequestMapping("/collectionViewMakeup.do")
	public ModelAndView collectionViewMakeup(int makeupNo) {
		ModelAndView mav = new ModelAndView();
		return mav;
		
	}
	
}
