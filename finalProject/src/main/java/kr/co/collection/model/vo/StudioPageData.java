package kr.co.collection.model.vo;

import java.util.ArrayList;

public class StudioPageData {
	private ArrayList<Studio> sList;
	private String pageNavi;
	private int reqPage;
	public StudioPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudioPageData(ArrayList<Studio> sList, String pageNavi, int reqPage) {
		super();
		this.sList = sList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}
	public ArrayList<Studio> getsList() {
		return sList;
	}
	public void setsList(ArrayList<Studio> sList) {
		this.sList = sList;
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
