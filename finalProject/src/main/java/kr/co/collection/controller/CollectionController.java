package kr.co.collection.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.collection.model.service.CollectionService;
import kr.co.collection.model.vo.AllPageData;

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
		if(code.equals("all")) {
			return "redirect:/collectionListAll.do?reqPage="+reqPage;
		}else if(code.equals("D")) {
			return "redirect:/collectionListDress.do?reqPage="+reqPage;
		}else if(code.equals("S")) {
			return "redirect:/collectionListStudio.do?reqPage="+reqPage;
		}else if(code.equals("M")) {
			return "redirect:/collectionListMakeup.do?reqPage="+reqPage;
		}		
		return "redirect:/collectionListAll.do?reqPage="+reqPage;
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
	public String collectionView() {
		System.out.println("뷰");
		return "redirect:/collectionTest.jsp";
	}

/*	@RequestMapping("/collectionListAll.do")
	public ModelAndView collectionListAll() {
		ModelAndView mav =  new ModelAndView();
		mav.addObject("dList", collectionService.allListDress());
		mav.addObject("sList", collectionService.allListStudio());
		mav.addObject("mList", collectionService.allListMakeup());
		mav.setViewName("collection/collectionList");
		return mav;
	}*/	
/*	@RequestMapping("/collectionListStudio.do")
	public ModelAndView collectionListStudio() {
		ModelAndView mav =  new ModelAndView();
		mav.addObject("sList", collectionService.allListStudio());
		mav.setViewName("collection/collectionList");
		return mav;
	}*/
/*	@RequestMapping("/collectionListDress.do")
	public ModelAndView collectionListDress() {
		ModelAndView mav =  new ModelAndView();
		mav.addObject("sList", collectionService.allListDress());
		mav.setViewName("collection/collectionList");
		return mav;
	}*/
/*	@RequestMapping("/collectionListMakeup.do")
	public ModelAndView collectionListMakeup() {
		ModelAndView mav =  new ModelAndView();
		mav.addObject("mList", collectionService.allListMakeup());
		mav.setViewName("collection/collectionList");
		return mav;
	}*/
}
