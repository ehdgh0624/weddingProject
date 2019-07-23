package kr.co.review.model.dao;

import java.util.ArrayList;
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
	
	public ArrayList<Review> selectCountReview(String code, int objectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		List<Review> list = sqlSession.selectList("review.selectCountReview", map);
		return (ArrayList<Review>)list;
	}
	
	public int updateScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum) {
		int cal = 0;
		if(reviewCount < 1) {
			cal = reviewScope;			
		}else {
			cal = (reviewSum + reviewScope) / (reviewCount+1);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("cal", cal);
		if(code.equals("S")) {
			return sqlSession.update("studio.updateScope",map);
		}else if(code.equals("D")) {
			return sqlSession.update("dress.updateScope",map);						
		}else if(code.equals("M")) {
			return sqlSession.update("makeup.updateScope",map);						
		}else if(code.equals("G")) {
			return sqlSession.update("goods.updateScope",map);			
		}else if(code.equals("H")){
			return sqlSession.update("hall.updateScope",map);
		}else {
			return 0;
		}
	}
	
	public int deleteReview(int reviewNo) {
		return sqlSession.delete("review.deleteReview",reviewNo);
	}
	
	public int deleteScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum) {
		int cal = 0;
		if(reviewCount > 1) {
			cal = (reviewSum-reviewScope) / (reviewCount-1);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("cal", cal);
		if(code.equals("S")) {
			return sqlSession.update("studio.deleteScope",map);
		}else if(code.equals("D")) {
			return sqlSession.update("dress.deleteScope",map);						
		}else if(code.equals("M")) {
			return sqlSession.update("makeup.deleteScope",map);						
		}else if(code.equals("G")) {
			return sqlSession.update("goods.deleteScope",map);			
		}else if(code.equals("H")){
			return sqlSession.update("hall.deleteScope",map);
		}else {
			return 0;
		}		
	}
	
	public int updateReview(int reviewNo, String reviewContent, int newReviewScope) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewNo", reviewNo);
		map.put("reviewContent", reviewContent);
		map.put("newReviewScope", newReviewScope);
		return sqlSession.update("review.updateReview",map);
	}
	
	public int deleteInsertScope(String code, int objectNo, int reviewScope, int reviewCount, int reviewSum, int newReviewScope) {
		int cal = 0;
		if(reviewCount == 1) {
			cal = newReviewScope;
		}else {
			cal = ((reviewSum-reviewScope)+newReviewScope) / (reviewCount);			
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("cal", cal);
		if(code.equals("S")) {
			return sqlSession.update("studio.deleteInsertScope",map);
		}else if(code.equals("D")) {
			return sqlSession.update("dress.deleteInsertScope",map);						
		}else if(code.equals("M")) {
			return sqlSession.update("makeup.deleteInsertScope",map);						
		}else if(code.equals("G")) {
			return sqlSession.update("goods.deleteInsertScope",map);			
		}else if(code.equals("H")){
			return sqlSession.update("hall.deleteInsertScope",map);
		}else {
			return 0;
		}		
	}
}
