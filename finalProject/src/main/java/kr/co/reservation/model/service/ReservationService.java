package kr.co.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.reservation.model.dao.ReservationDao;

@Service("reservationService")
public class ReservationService {
	@Autowired
	@Qualifier("reservationDao")
	private ReservationDao reservationDao;
}
