package kr.co.member.model.vo;

import java.util.ArrayList;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;

public class SDMList {
	ArrayList<Studio> sList;
	ArrayList<Dress> dList;
	ArrayList<Makeup> mList;
	public SDMList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SDMList(ArrayList<Studio> sList, ArrayList<Dress> dList, ArrayList<Makeup> mList) {
		super();
		this.sList = sList;
		this.dList = dList;
		this.mList = mList;
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
	@Override
	public String toString() {
		return "SDMList [sList=" + sList + ", dList=" + dList + ", mList=" + mList + "]";
	}
	
	
	

}
