package kr.co.hall.vo;

import java.util.ArrayList;

import kr.co.scrapbook.model.vo.Scrapbook;

public class HallPage {
	private ArrayList<Hall> hList;
	private String pageNavi;
	private int reqPage;
	private ArrayList<Scrapbook> scrapList;

	public HallPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HallPage(ArrayList<Hall> hList, String pageNavi, int reqPage, ArrayList<Scrapbook> scrapList) {
		super();
		this.hList = hList;
		this.pageNavi = pageNavi;
		this.reqPage = reqPage;
		this.scrapList = scrapList;
	}

	public ArrayList<Hall> gethList() {
		return hList;
	}

	public void sethList(ArrayList<Hall> hList) {
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

	public ArrayList<Scrapbook> getScrapList() {
		return scrapList;
	}

	public void setScrapList(ArrayList<Scrapbook> scrapList) {
		this.scrapList = scrapList;
	}

}
