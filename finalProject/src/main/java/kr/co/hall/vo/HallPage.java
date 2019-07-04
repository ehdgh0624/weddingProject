package kr.co.hall.vo;

import java.util.ArrayList;

import kr.co.member.model.vo.MemberHall;

public class HallPage {
	private ArrayList<MemberHall> hList;
	private String pageNavi;
	private int reqPage;

	public HallPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HallPage(ArrayList<MemberHall> hList, String pageNavi, int reqPage) {
		super();
		this.hList = hList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}

	public ArrayList<MemberHall> gethList() {
		return hList;
	}

	public void sethList(ArrayList<MemberHall> hList) {
		this.hList = hList;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getReqPage() {
		return reqPage;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}

	@Override
	public String toString() {
		return "HallPage [hList=" + hList + ", pageNavi=" + pageNavi + ", reqPage=" + reqPage + "]";
	}

}
