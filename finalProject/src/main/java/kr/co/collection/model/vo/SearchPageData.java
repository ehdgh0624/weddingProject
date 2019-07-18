package kr.co.collection.model.vo;

import java.util.ArrayList;

import kr.co.scrapbook.model.vo.Scrapbook;

public class SearchPageData {
	private ArrayList<Collection> cList;
	private ArrayList<Scrapbook> scrapList;
	private String pageNavi;
	private int reqPage;
	public SearchPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchPageData(ArrayList<Collection> cList, ArrayList<Scrapbook> scrapList, String pageNavi, int reqPage) {
		super();
		this.cList = cList;
		this.scrapList = scrapList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
	}
	public ArrayList<Collection> getcList() {
		return cList;
	}
	public void setcList(ArrayList<Collection> cList) {
		this.cList = cList;
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
