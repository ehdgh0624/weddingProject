package kr.co.collection.model.vo;

import java.util.ArrayList;

public class MakeupPageData {
	private ArrayList<Makeup> mList;
	private String pageNavi;
	private int reqPage;
	public MakeupPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MakeupPageData(ArrayList<Makeup> mList, String pageNavi, int reqPage) {
		super();
		this.mList = mList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}
	public ArrayList<Makeup> getmList() {
		return mList;
	}
	public void setmList(ArrayList<Makeup> mList) {
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
}
