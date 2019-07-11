package kr.co.experience.vo;

import java.util.ArrayList;

public class ExperienePageDate {
	private ArrayList<Experience> exList;
	private String pageNavi;
	public ExperienePageDate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExperienePageDate(ArrayList<Experience> exList, String pageNavi) {
		super();
		this.exList = exList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Experience> getExList() {
		return exList;
	}
	public void setExList(ArrayList<Experience> exList) {
		this.exList = exList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
