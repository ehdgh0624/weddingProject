package kr.co.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.review.model.dao.ReviewDao;

@Service("reviewService")
public class ReviewService {
	@Autowired
	@Qualifier("reviewDao")
	private ReviewDao reviewDao;
}
