package kr.co.hall.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gallery.model.vo.Gallery;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallSelect;
import kr.co.reservation.model.vo.Reservation;
import kr.co.review.model.vo.Review;
import kr.co.scrapbook.model.vo.Scrapbook;



@Repository("hallDao")
public class HallDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Hall> pageHallList(int start, int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("hall.pageSelectAllList",map);
	}
	public int totalCount() {
		int count = sqlSession.selectOne("hall.selectAllList");
		return count;
	}
	public List<Hall> searchHall(int start, int end, Hall h, int person) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("hallLoc", h.getHallLoc());
		map.put("hallType", h.getHallType());
		map.put("hallFoodtype", String.valueOf(h.getHallFoodtype()));
		map.put("hallName", h.getHallName());
		map.put("person", String.valueOf(person));
		return sqlSession.selectList("hall.hallSearch",map);
	}
	public int totalCountSearch(Hall h, int person) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("hallLoc", h.getHallLoc());
		map.put("hallType", h.getHallType());
		map.put("hallFoodtype", String.valueOf(h.getHallFoodtype()));
		map.put("hallName", h.getHallName());
		map.put("person", String.valueOf(person));
		int count = sqlSession.selectOne("hall.searchList",map);
		return count;
	}
	public List<Hall> hallPc(int start, int end , int hCode) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("hCode", hCode);
		return sqlSession.selectList("hall.hallPc",map);
	}
	public int totalCountPc() {
		int count = sqlSession.selectOne("hall.countPc");
		return count;
	}
	public Object selectOneHall(int hallNo) {
		return (Hall)sqlSession.selectOne("hall.viewSelectOne",hallNo);
	}
	public List<Gallery> selectListGallery(int galleryNo, String galleryCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("galleryNo", galleryNo);
		map.put("galleryCode", galleryCode);
		return sqlSession.selectList("gallery.selectListGallery",map);
	}
	public List<Review> selectListReview(int objectNo, String code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewRef", objectNo);
		map.put("code", code);
		return sqlSession.selectList("review.selectListReview",map);
	}
	public Scrapbook selectOneScrapbook(String memberId, String code, int objectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(memberId == null) {
			memberId = "null";
		}
		map.put("memberId", memberId);
		map.put("code", code);
		map.put("objectNo", objectNo);
		return (Scrapbook)sqlSession.selectOne("scrapbook.selectOneScrapbook",map);
	}
	public List<HallSelect> selectListHall(int hallNo) {
		return  sqlSession.selectList("hallSelect.selectListHallSelect",hallNo);
	}
	public HallSelect selectOption(int result) {
		return sqlSession.selectOne("hallSelect.selectOption",result);
	}
	public int insertReservationHall(Reservation vo, String weddingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", vo.getCode());
		map.put("prdNo", vo.getPrdNo());
		map.put("prdId", vo.getPrdId());
		map.put("prdName",vo.getPrdName());
		map.put("weddingDate", weddingDate);
		map.put("weddingTime", vo.getWeddingTime());
		map.put("totalPrice", vo.getTotalPrice());
		map.put("memberId", vo.getMemberId());
		map.put("memberName", vo.getMemberName());
		map.put("memberPhone", vo.getMemberPhone());
		map.put("memberEmail", vo.getMemberEmail());
		map.put("option", vo.getHallSelect());
		map.put("price", vo.getHallPrice());
		map.put("person", vo.getHallPerson());
		map.put("foodType", vo.getHallFoodtype());
		map.put("foodCount", vo.getHallFoodcount());
		return sqlSession.insert("reservation.insertReservationHall",map);
	}
	public int selectReservationNo(String memberId) {
		int result = sqlSession.selectOne("reservation.selectReservationNo",memberId);
		return result;
	}
	
}
