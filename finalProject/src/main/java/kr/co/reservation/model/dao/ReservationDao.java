package kr.co.reservation.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.reservation.model.vo.Reservation;

@Repository("reservationDao")
public class ReservationDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Reservation selectOneReservation(int reservationNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationNo", reservationNo);
		map.put("memberId", memberId);
		return (Reservation)sqlSession.selectOne("reservation.viewSelectOne",map);
	}
	
	public int updateOrderStatusCancel(int reservationNo) {
		return sqlSession.update("reservation.updateOrderStatusCancel", reservationNo);
	}
	
	public int option1Price(String code, int objectNo, String option) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("option", option);
		if(code.equals("S")) {
			return sqlSession.selectOne("studioSelect.option1Price", map);			
		}else if(code.equals("D")) {
			return sqlSession.selectOne("dress.option1Price", map);
		}else if(code.equals("M")) {
			return sqlSession.selectOne("makeup.option1Price", map);			
		}
		return -1;
	}
	
	public int option2Price(String code, int objectNo, String option) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("option", option);
		if(code.equals("S")) {
			return sqlSession.selectOne("studioSelect.option2Price", map);			
		}else if(code.equals("D")) {
			return sqlSession.selectOne("dress.option2Price", map);
		}else if(code.equals("M")) {
			return sqlSession.selectOne("makeup.option2Price", map);			
		}
		return -1;
	}

	public int option3Price(String code, int objectNo, String option) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("objectNo", objectNo);
		map.put("option", option);
		if(code.equals("S")) {
			return sqlSession.selectOne("studioSelect.option3Price", map);			
		}else if(code.equals("D")) {
			return sqlSession.selectOne("dress.option3Price", map);
		}else if(code.equals("M")) {
			return sqlSession.selectOne("makeup.option3Price", map);			
		}
		return -1;
	}

}
