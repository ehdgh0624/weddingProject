package kr.co.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.review.model.vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertReview(Review vo) {
		return sqlSession.insert("review.insertReview",vo);
	}
}
