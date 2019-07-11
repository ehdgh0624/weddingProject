package kr.co.admin.vo;

import java.util.ArrayList;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;

public class AdminCompany {
	private ArrayList<CompanyVo> aList;
	private String pageNavi;
	public AdminCompany() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArrayList<CompanyVo> getaList() {
		return aList;
	}
	public void setaList(ArrayList<CompanyVo> aList) {
		this.aList = aList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public AdminCompany(ArrayList<CompanyVo> aList, String pageNavi) {
		this.aList = aList;
		this.pageNavi = pageNavi;
	}
		
}

