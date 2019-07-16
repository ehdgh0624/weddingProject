package kr.co.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.member.model.vo.Member;
import kr.co.review.model.service.ReviewService;
import kr.co.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;

	@RequestMapping("/fileUpload.do")
	public String fileUpload(HttpSession session, HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mtfRequest, Review vo){
		Member m = (Member) session.getAttribute("member");
		if(m != null) {
			List<MultipartFile> fileList = mtfRequest.getFiles("uploadFile");
			if(!fileList.get(0).equals("")) {
				String src = mtfRequest.getParameter("src");
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
				String fileName = "";
				String filePath = "";
				int index = 0;
				for(MultipartFile mf : fileList) {
					index++;
					String originFileName = mf.getOriginalFilename();		//원본 파일명
					long fileSize = mf.getSize();				//파일 사이즈
					String fileSave = System.currentTimeMillis() + originFileName;
					String safeFile = savePath + fileSave;					//변경된 파일명
					fileName += originFileName;
					filePath += safeFile;
					if(index < fileList.size()) {
						fileName += ",";
						filePath += ",";
					}
					try {
						mf.transferTo(new File(safeFile));
					} catch(IllegalStateException e) {
						e.printStackTrace();
					} catch(IOException e) {
						e.printStackTrace();
					}
				}
				vo.setReviewFilename(fileName);
				vo.setReviewFilepath(filePath);
			}
		}else {
			return "redirect:/loginPage.do";
		}
	}
}
