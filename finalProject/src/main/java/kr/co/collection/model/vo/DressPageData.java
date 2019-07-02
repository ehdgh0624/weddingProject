package kr.co.collection.model.vo;

import java.util.ArrayList;

public class DressPageData {
	private ArrayList<Dress> dList;
	private String pageNavi;
	private int reqPage;
	public DressPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DressPageData(ArrayList<Dress> dList, String pageNavi, int reqPage) {
		super();
		this.dList = dList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}
	public ArrayList<Dress> getdList() {
		return dList;
	}
	public void setdList(ArrayList<Dress> dList) {
		this.dList = dList;
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
