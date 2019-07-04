
package kr.co.member.model.vo;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;

public class MemberAll {
	private Dress dress;
	private Studio studio;
	private Makeup makeup;
	private Hall hall;
	public MemberAll(Dress dress, Studio studio, Makeup makeup, Hall hall) {
		super();
		this.dress = dress;
		this.studio = studio;
		this.makeup = makeup;
		this.hall = hall;
	}
	public MemberAll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dress getDress() {
		return dress;
	}
	public void setDress(Dress dress) {
		this.dress = dress;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public Makeup getMakeup() {
		return makeup;
	}
	public void setMakeup(Makeup makeup) {
		this.makeup = makeup;
	}
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	
	

}




