package kr.co.review.model.service;

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
	
	public int selectCountReview(String code, int objectNo) {
		return reviewDao.selectCountReview(code, objectNo);
	}
	
	public int updateScope(String code, int objectNo, int reviewScope, int reviewCount) {
		return reviewDao.updateScope(code, objectNo, reviewScope, reviewCount);
	}
}
