package kr.co.qna.controller;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.member.model.vo.Member;
import kr.co.qna.service.QnAService;
import kr.co.qna.vo.QnA;
import kr.co.qna.vo.QnADataPage;

@Controller
public class QnAController {
	@Autowired
	@Qualifier(value="qnaService")
	private QnAService qnaService;

	@RequestMapping(value="/qnaMain.do")
	public String qnamain(HttpServletRequest request,Model model) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		QnADataPage qdp = qnaService.qnaAll(reqPage);
		model.addAttribute("qdp", qdp);
		return "QNA/QnAmain";
	}
	@RequestMapping(value="/qnawritePage.do")
	public String qnaWritePage(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession(false);
		if(session !=null&&(Member)session.getAttribute("member")!=null) {
			return "redirect:/QNA/qnaWriterPage.jsp";
		}else {
			model.addAttribute("msg", "로그인후 사용가능합니다");
			model.addAttribute("loc", "qnaMain.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/qnaWrite.do")
	public String qnaWrite(HttpServletRequest request,QnA qna,Model model,String qnaChk) {
		if(qnaChk != null) {
			qna.setQnaCheck(0);
		}else {
			qna.setQnaCheck(1);
		}
		qna.setQnaTitle(qna.getQnaTitle().replace("<", "&lt;"));
		qna.setQnaTitle(qna.getQnaTitle().replace(">", "&gt;"));
		qna.setQnaContent(qna.getQnaContent().replace("<", "&lt;"));
		qna.setQnaContent(qna.getQnaContent().replace(">", "&gt;"));
		qna.setQnaContent(qna.getQnaContent().replace("\r\n", "<br>"));
		int result = qnaService.insertQna(qna);
		if(result>0) {
			model.addAttribute("msg", "게시글을 등록 하였습니다.");
			model.addAttribute("loc", "qnaMain.do");
			return "common/msg";
		}else {
			model.addAttribute("msg", "게시글을 등록을 실패하였습니다.");
			model.addAttribute("loc", "qnaMain.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/qnaView.do")
	public String qnaView(HttpServletRequest request,Model model) {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnA qna = qnaService.selectOneQna(qnaNo);
		model.addAttribute("qna", qna);
		return "QNA/QnAViewPage";
	}
	//비밀번호 확이 서블릿
	@ResponseBody
	@RequestMapping(value="/pwChk.do")
	public void pwChk(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		int result = qnaService.pwChk(num,pass);
		if(result>0) {
			response.getWriter().println(result);
		}else {
			response.getWriter().println(result);
		}
	}
	@RequestMapping(value="/commentUpdate.do")
	public String commentUpdate(QnA qna ,Model model) {
		qna.setQnaAnswer(qna.getQnaAnswer().replace("<", "&lt;"));
		qna.setQnaAnswer(qna.getQnaAnswer().replace(">", "&gt;"));
		qna.setQnaAnswer(qna.getQnaAnswer().replace("\r\n", "<br>"));
		int result = qnaService.commentUpdate(qna);
		if(result>0) {
			model.addAttribute("msg", "답변을 추가 하였습니다.");
			model.addAttribute("loc", "qnaView.do?qnaNo="+qna.getqnaNo());
			return "common/msg";
		}else {
			model.addAttribute("msg", "답변달기를 실패 했습니다.");
			model.addAttribute("loc", "qnaView.do?qnaNo="+qna.getqnaNo());
			return "common/msg";
		}
	}
	@RequestMapping(value="/qnaUpdatePage.do")
	public String qnaUpdatePage(HttpServletRequest request,Model model) {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnA qna = qnaService.selectOneQna(qnaNo);
		qna.setQnaContent(qna.getQnaContent().replace("&lt;", "<"));
		qna.setQnaContent(qna.getQnaContent().replace("&gt;", ">"));
		qna.setQnaContent(qna.getQnaContent().replace("<br>", "\r\n"));
		model.addAttribute("qna", qna);
		return "QNA/QnAUpdatePage";
	}
	@RequestMapping(value="/qnaUpdate.do")
	public String qnaUpdatePage(HttpServletRequest request,Model model,QnA qna,String qnaChk) {
		if(qnaChk != null) {
			qna.setQnaCheck(0);
		}else {
			qna.setQnaCheck(1);
		}
		qna.setQnaTitle(qna.getQnaTitle().replace("<", "&lt;"));
		qna.setQnaTitle(qna.getQnaTitle().replace(">", "&gt;"));
		qna.setQnaContent(qna.getQnaContent().replace("<", "&lt;"));
		qna.setQnaContent(qna.getQnaContent().replace(">", "&gt;"));
		qna.setQnaContent(qna.getQnaContent().replace("\r\n", "<br>"));
		int result = qnaService.updateQna(qna);
		if(result>0) {
			model.addAttribute("msg", "게시글을 수정 하였습니다.");
			model.addAttribute("loc", "qnaView.do?qnaNo="+qna.getqnaNo());
			return "common/msg";
		}else {
			model.addAttribute("msg", "게시글 수정을 실패하였습니다.");
			model.addAttribute("loc", "qnaView.do?qnaNo="+qna.getqnaNo());
			return "common/msg";
		}
	}
	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(String qnaNo,Model model) {
		int result = qnaService.deleteQna(qnaNo);
		if(result>0) {
			model.addAttribute("msg", "게시글을 삭제 하였습니다.");
			model.addAttribute("loc", "qnaMain.do");
			return "common/msg";
		}else {
			model.addAttribute("msg", "게시글 삭제를 실패하였습니다.");
			model.addAttribute("loc", "qnaMain.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/qnaSearch.do")
	public String qnaSearch(String keyword,HttpServletRequest request,Model model) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch(NumberFormatException e) {
			reqPage = 1;
		}
		QnADataPage qdp = qnaService.qnaSearch(reqPage,keyword);
		model.addAttribute("qdp", qdp);
		return "QNA/QnAmain";
	}
}
