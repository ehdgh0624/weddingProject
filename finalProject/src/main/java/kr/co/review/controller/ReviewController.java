package kr.co.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.member.model.vo.Member;
import kr.co.review.model.service.ReviewService;
import kr.co.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	@Qualifier("reviewService")
	private ReviewService reviewService;

	@RequestMapping("/fileUpload.do")
	public ModelAndView fileUpload(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest mtfRequest, Review vo) {
		System.out.println(mtfRequest);
		String goodsType = vo.getCode();
		if (goodsType.equals("B") || goodsType.equals("I")) {
			vo.setCode("G");
		}
		Member m = (Member) session.getAttribute("member");
		System.out.println("리뷰 별점 : " + vo.getReviewScope());
		ModelAndView mav = new ModelAndView();
		if (m != null) {
			vo.setMemberId(m.getMemberId());
			vo.setReviewWriter(m.getMemberName());
			vo.setReviewContent(vo.getReviewContent().replace("<", "&lt;").replace(">", "&gt;").replace(" ", "&nbsp;")
					.replace("\"", "&quot;").replace("\r\n", "<br>"));
				List<MultipartFile> fileList = mtfRequest.getFiles("uploadFile");
				System.out.println("컨트롤러 file : "+fileList.get(0).getOriginalFilename());
			if (!fileList.get(0).getOriginalFilename().equals("") || !fileList.get(0).getOriginalFilename().isEmpty()) {
				String src = mtfRequest.getParameter("src");
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
				String fileName = "";
				String filePath = "";
				int index = 0;
				for (MultipartFile mf : fileList) {
					index++;
					String originFileName = mf.getOriginalFilename(); // 원본 파일명
					long fileSize = mf.getSize(); // 파일 사이즈
					String fileSave = System.currentTimeMillis() + originFileName;
					String safeFile = savePath + fileSave; // 파일 업로드 경로
					fileName += originFileName;
					filePath += fileSave; // 내려받을 파일 경로
					if (index < fileList.size()) {
						fileName += ",";
						filePath += ",";
					}
					try {
						mf.transferTo(new File(safeFile));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				vo.setReviewFilename(fileName);
				vo.setReviewFilepath(filePath);
			}
			ArrayList<Review> reviewList = reviewService.selectCountReview(vo.getCode(), vo.getReviewRef());
			int reviewCount = 0;
			int reviewSum = 0;
			if (!reviewList.isEmpty()) {
				reviewCount = reviewList.size();

				for (Review i : reviewList) {
					reviewSum += i.getReviewScope();
				}
			}
			int scopeResult = reviewService.updateScope(vo.getCode(), vo.getReviewRef(), vo.getReviewScope(),
					reviewCount, reviewSum);
			int result = reviewService.insertReview(vo);
			if (goodsType.equals("B") || goodsType.equals("I")) {
				mav.addObject("code", goodsType);
			} else {
				mav.addObject("code", vo.getCode());
			}
			mav.addObject("objectNo", vo.getReviewRef());
			if (result > 0) {
				mav.setViewName("review/reviewSuccess");
			} else {
				mav.setViewName("review/reviewFailed");
			}
			return mav;
		} else {
			mav.addObject("cause", 1);
			mav.setViewName("review/reviewFailed");
			return mav;
		}
	}

	@ResponseBody
	@RequestMapping("/deleteReview.do")
	public int deleteReview(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam int reviewNo, @RequestParam String reviewFilepath, @RequestParam int objectNo, @RequestParam String code, @RequestParam int reviewScope) {
		String []filepath = reviewFilepath.split(",");
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
		for(int i=0;i<filepath.length;i++) {
			File fe = new File(savePath + "/" + filepath[i]);			
			if (fe.exists()) { // 파일존재여부확인
				if (fe.isFile()) {
					fe.delete();
				}
			}
		}		
		ArrayList<Review> reviewList = reviewService.selectCountReview(code, objectNo);
		int reviewCount = 0;
		int reviewSum = 0;
		if (!reviewList.isEmpty()) {
			reviewCount = reviewList.size();
			for (Review i : reviewList) {
				reviewSum += i.getReviewScope();
			}
		}
		int result = reviewService.deleteReview(reviewNo);
		int scopeResult = reviewService.deleteScope(code, objectNo, reviewScope, reviewCount, reviewSum);			
		return scopeResult;
	}
}
