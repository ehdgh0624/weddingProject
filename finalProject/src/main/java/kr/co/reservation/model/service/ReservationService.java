package kr.co.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.reservation.model.dao.ReservationDao;
import kr.co.reservation.model.vo.Reservation;

@Service("reservationService")
public class ReservationService {
	@Autowired
	@Qualifier("reservationDao")
	private ReservationDao reservationDao;
	
	public Reservation selectOneReservation(int reservationNo, String memberId) {
		return reservationDao.selectOneReservation(reservationNo, memberId);
	}
	
	@Transactional
	public int updateOrderStatusCancel(int reservationNo) {
		return reservationDao.updateOrderStatusCancel(reservationNo);
	}
	
	public int option1Price(String code, int objectNo, String option) {
		return reservationDao.option1Price(code, objectNo, option);
	}
	
	public int option2Price(String code, int objectNo, String option) {
		return reservationDao.option2Price(code, objectNo, option);
	}
	
	public int option3Price(String code, int objectNo, String option) {
		return reservationDao.option3Price(code, objectNo, option);
	}

}
