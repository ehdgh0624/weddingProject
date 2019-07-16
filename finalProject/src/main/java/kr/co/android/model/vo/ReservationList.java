package kr.co.android.model.vo;

import java.util.ArrayList;

import kr.co.reservation.model.vo.Reservation;

public class ReservationList {
	
	private String code;
	
	private ArrayList<Reservation> list;

	public ReservationList(String code, ArrayList<Reservation> list) {
		super();
		this.code = code;
		this.list = list;
	}

	public ReservationList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public ArrayList<Reservation> getList() {
		return list;
	}

	public void setList(ArrayList<Reservation> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ReservationList [code=" + code + ", list=" + list + "]";
	}
	
	

}
