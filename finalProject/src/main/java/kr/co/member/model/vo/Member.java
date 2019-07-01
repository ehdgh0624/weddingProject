package kr.co.member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPw;
	private String birthDay;
	private String phone;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	private String email;
	private String addr;
	private int addrCode;
	private Date marryDay;
	private int visitNum;
	private int budget;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberPw, String birthDay,String phone, String email, String addr, int addrCode,
			Date marryDay, int visitNum, int budget) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.birthDay = birthDay;
		this.email = email;
		this.addr = addr;
		this.addrCode = addrCode;
		this.marryDay = marryDay;
		this.visitNum = visitNum;
		this.budget = budget;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getAddrCode() {
		return addrCode;
	}
	public void setAddrCode(int addrCode) {
		this.addrCode = addrCode;
	}
	public Date getMarryDay() {
		return marryDay;
	}
	public void setMarryDay(Date marryDay) {
		this.marryDay = marryDay;
	}
	public int getVisitNum() {
		return visitNum;
	}
	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", birthDay=" + birthDay + ", email=" + email
				+ ", addr=" + addr + ", addrCode=" + addrCode + ", marryDay=" + marryDay + ", visitNum=" + visitNum
				+ ", budget=" + budget + "]";
	}
	
	
	
}
