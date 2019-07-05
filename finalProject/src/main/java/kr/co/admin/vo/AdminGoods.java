package kr.co.admin.vo;

import java.util.ArrayList;

import kr.co.goods.model.vo.Goods;

public class AdminGoods {
	private ArrayList<Goods> list;
	private String pageNavi;
	public AdminGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminGoods(ArrayList<Goods> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Goods> getList() {
		return list;
	}
	public void setList(ArrayList<Goods> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
