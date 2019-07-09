package kr.co.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.reservation.model.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;
}
