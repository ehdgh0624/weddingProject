package kr.co.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
