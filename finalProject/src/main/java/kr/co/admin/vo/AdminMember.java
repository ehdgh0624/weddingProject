package kr.co.admin.vo;

import java.util.ArrayList;

import kr.co.member.model.vo.Member;

public class AdminMember {
	private ArrayList<Member> list;
	private String pageNavi;
	public AdminMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminMember(ArrayList<Member> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Member> getList() {
		return list;
	}
	public void setList(ArrayList<Member> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
