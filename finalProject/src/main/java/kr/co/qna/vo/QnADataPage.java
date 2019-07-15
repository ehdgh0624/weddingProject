package kr.co.qna.vo;

import java.util.ArrayList;

public class QnADataPage {
	private ArrayList<QnA> list;
	private String pageNavi;
	public QnADataPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnADataPage(ArrayList<QnA> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<QnA> getList() {
		return list;
	}
	public void setList(ArrayList<QnA> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
