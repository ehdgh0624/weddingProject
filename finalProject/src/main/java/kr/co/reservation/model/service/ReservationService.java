package kr.co.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	
	public int updateOrderStatusCancel(int reservationNo) {
		return reservationDao.updateOrderStatusCancel(reservationNo);
	}
}
