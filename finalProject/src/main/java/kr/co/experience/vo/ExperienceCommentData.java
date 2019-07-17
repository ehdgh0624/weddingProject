package kr.co.experience.vo;

import java.util.ArrayList;

public class ExperienceCommentData {
	private ArrayList<ExperienceComment> list;
	private Experience e;
	public ExperienceCommentData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExperienceCommentData(ArrayList<ExperienceComment> list, Experience e) {
		super();
		this.list = list;
		this.e = e;
	}
	public ArrayList<ExperienceComment> getList() {
		return list;
	}
	public void setList(ArrayList<ExperienceComment> list) {
		this.list = list;
	}
	public Experience getE() {
		return e;
	}
	public void setE(Experience e) {
		this.e = e;
	}
	
	
}
