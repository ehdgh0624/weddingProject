
package kr.co.member.model.vo;

import java.util.ArrayList;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;

public class MemberAll {
	private ArrayList<Dress> dress;
	private ArrayList<Studio> studio;
	private ArrayList<Makeup> makeup;
	private ArrayList<Hall> hall;
	public MemberAll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberAll(ArrayList<Dress> dress, ArrayList<Studio> studio, ArrayList<Makeup> makeup, ArrayList<Hall> hall) {
		super();
		this.dress = dress;
		this.studio = studio;
		this.makeup = makeup;
		this.hall = hall;
	}
	public ArrayList<Dress> getDress() {
		return dress;
	}
	public void setDress(ArrayList<Dress> dress) {
		this.dress = dress;
	}
	public ArrayList<Studio> getStudio() {
		return studio;
	}
	public void setStudio(ArrayList<Studio> studio) {
		this.studio = studio;
	}
	public ArrayList<Makeup> getMakeup() {
		return makeup;
	}
	public void setMakeup(ArrayList<Makeup> makeup) {
		this.makeup = makeup;
	}
	public ArrayList<Hall> getHall() {
		return hall;
	}
	public void setHall(ArrayList<Hall> hall) {
		this.hall = hall;
	}
	@Override
	public String toString() {
		return "MemberAll [dress=" + dress + ", studio=" + studio + ", makeup=" + makeup + ", hall=" + hall + "]";
	}
	
	
	

}




