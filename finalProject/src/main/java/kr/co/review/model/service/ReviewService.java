package kr.co.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.review.model.dao.ReviewDao;
import kr.co.review.model.vo.Review;

@Service("reviewService")
public class ReviewService {
	@Autowired
	@Qualifier("reviewDao")
	private ReviewDao reviewDao;
	
	@Transactional
	public int insertReview(Review vo) {
		return reviewDao.insertReview(vo);
	}
	
	public ArrayList<Review> selectCountReview(String code, int objectNo) {
		return reviewDao.selectCountReview(code, objectNo);
	}
	
	public int updateScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum) {
		return reviewDao.updateScope(code, objectNo, reviewScope, reviewCount, reviewSum);
	}
	
	@Transactional
	public int deleteReview(int reviewNo) {
		return reviewDao.deleteReview(reviewNo);
	}
	
	@Transactional
	public int deleteScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum) {
		return reviewDao.deleteScope(code, objectNo, reviewScope, reviewCount, reviewSum);
	}
	
	@Transactional
	public int updateReview(int reviewNo, String reviewContent, int newReviewScope) {
		return reviewDao.updateReview(reviewNo, reviewContent, newReviewScope);
	}
	
	@Transactional
	public int deleteInsertScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum, int newReviewScope) {
		return reviewDao.deleteInsertScope(code, objectNo, reviewScope, reviewCount, reviewSum, newReviewScope);
	}

}
