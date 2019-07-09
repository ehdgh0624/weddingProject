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
}
