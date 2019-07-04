package kr.co.simulator.model.vo;

import java.sql.Date;

public class Simulator {
	private int simulatorNo;		//웨딩계산기 고유번호
	private String memberId;		//회원 아이디
	private String weddingDate;		//예식일
	private String weddingLoc;		//지역
	private int weddingPerson;	//하객수
	private int simulatorTotalPrice;//웨딩계산기 총 금액
	private Date simulatorDate;		//웨딩계산기 견적 작성일
	
	public Simulator() {
		super();
	}

	public Simulator(int simulatorNo, String memberId, String weddingDate, String weddingLoc, int weddingPerson,
			int simulatorTotalPrice, Date simulatorDate) {
		super();
		this.simulatorNo = simulatorNo;
		this.memberId = memberId;
		this.weddingDate = weddingDate;
		this.weddingLoc = weddingLoc;
		this.weddingPerson = weddingPerson;
		this.simulatorTotalPrice = simulatorTotalPrice;
		this.simulatorDate = simulatorDate;
	}

	public int getSimulatorNo() {
		return simulatorNo;
	}

	public void setSimulatorNo(int simulatorNo) {
		this.simulatorNo = simulatorNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getWeddingDate() {
		return weddingDate;
	}

	public void setWeddingDate(String weddingDate) {
		this.weddingDate = weddingDate;
	}

	public String getWeddingLoc() {
		return weddingLoc;
	}

	public void setWeddingLoc(String weddingLoc) {
		this.weddingLoc = weddingLoc;
	}

	public int getWeddingPerson() {
		return weddingPerson;
	}

	public void setWeddingPerson(int weddingPerson) {
		this.weddingPerson = weddingPerson;
	}

	public int getSimulatorTotalPrice() {
		return simulatorTotalPrice;
	}

	public void setSimulatorTotalPrice(int simulatorTotalPrice) {
		this.simulatorTotalPrice = simulatorTotalPrice;
	}

	public Date getSimulatorDate() {
		return simulatorDate;
	}

}
