package kr.co.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.reservation.model.vo.Reservation;

@Repository("reservationDao")
public class ReservationDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Reservation selectOneReservation(int reservationNo) {
		return (Reservation)sqlSession.selectOne("reservation.viewSelectOne",reservationNo);
	}
}
