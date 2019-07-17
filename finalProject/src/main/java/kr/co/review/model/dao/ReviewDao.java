package kr.co.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int selectCountReview(String code, int objectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		List<Review> list = sqlSession.selectList("review.selectCountReview", map);
		int count = 0;
		if(!list.isEmpty()) {
			count = list.size();
		}
		return count;
	}
	
	public int updateScope(String code, int objectNo, int reviewScope, int reviewCount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("reviewScope", reviewScope);
		map.put("reviewCount", reviewCount);
		if(code.equals("S")) {
			return sqlSession.update("studio.updateScope",map);
		}else if(code.equals("D")) {
			return sqlSession.update("dress.updateScope",map);						
		}else if(code.equals("M")) {
			return sqlSession.update("makeup.updateScope",map);						
		}else if(code.equals("G")) {
			return sqlSession.update("goods.updateScope",map);			
		}else {
			return 0;
		}
	}
}
