package kr.co.hall.vo;

import java.util.ArrayList;

import kr.co.member.model.vo.MemberHall;

public class HallPage {
	private ArrayList<MemberHall> mList;
	private String pageNavi;
	private int reqPage;

	public HallPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HallPage(ArrayList<MemberHall> mList, String pageNavi, int reqPage) {
		super();
		this.mList = mList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}

	public ArrayList<MemberHall> getmList() {
		return mList;
	}

	public void setmList(ArrayList<MemberHall> mList) {
		this.mList = mList;
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
		return "HallPage [mList=" + mList + ", pageNavi=" + pageNavi + ", reqPage=" + reqPage + "]";
	}

}
