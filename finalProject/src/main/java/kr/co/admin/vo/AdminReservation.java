package kr.co.admin.vo;

import java.util.ArrayList;

import kr.co.reservation.model.vo.Reservation;

public class AdminReservation {
	private ArrayList<Reservation> list;
	private String pageNavi;
	public AdminReservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminReservation(ArrayList<Reservation> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Reservation> getList() {
		return list;
	}
	public void setList(ArrayList<Reservation> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
