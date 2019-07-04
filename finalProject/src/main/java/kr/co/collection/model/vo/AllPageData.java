package kr.co.collection.model.vo;

import java.util.ArrayList;

import kr.co.scrapbook.model.vo.Scrapbook;

public class AllPageData {
	private ArrayList<Studio> sList;
	private ArrayList<Dress> dList;
	private ArrayList<Makeup> mList;
	private ArrayList<Scrapbook> scrapList;
	private String pageNavi;
	private int reqPage;
	public AllPageData() {
		super();
	}
	public AllPageData(ArrayList<Studio> sList, ArrayList<Dress> dList, ArrayList<Makeup> mList,
			ArrayList<Scrapbook> scrapList, String pageNavi, int reqPage) {
		super();
		this.sList = sList;
		this.dList = dList;
		this.mList = mList;
		this.scrapList = scrapList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}
	public ArrayList<Studio> getsList() {
		return sList;
	}
	public void setsList(ArrayList<Studio> sList) {
		this.sList = sList;
	}
	public ArrayList<Dress> getdList() {
		return dList;
	}
	public void setdList(ArrayList<Dress> dList) {
		this.dList = dList;
	}
	public ArrayList<Makeup> getmList() {
		return mList;
	}
	public void setmList(ArrayList<Makeup> mList) {
		this.mList = mList;
	}
	public ArrayList<Scrapbook> getScrapList() {
		return scrapList;
	}
	public void setScrapList(ArrayList<Scrapbook> scrapList) {
		this.scrapList = scrapList;
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
