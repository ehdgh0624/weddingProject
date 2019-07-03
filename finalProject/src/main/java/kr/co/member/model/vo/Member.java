package kr.co.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String birthDay;
	private String addr;
	private Date marrySchedule;
	private int expectVisitor;
	private int budget;
	private Date enrollDate;
	private int memberCode;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getMemberCode() {
		return memberCode;
	}


	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}


	public Member(int memberNo, String memberId, String memberPw, String memberName, String phone, String birthDay,
			String addr, Date marrySchedule, int expectVisitor, int budget, Date enrollDate, int memberCode) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.phone = phone;
		this.birthDay = birthDay;
		this.addr = addr;
		this.marrySchedule = marrySchedule;
		this.expectVisitor = expectVisitor;
		this.budget = budget;
		this.enrollDate = enrollDate;
		this.memberCode = memberCode;
	}


	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}	
	public int getMemberSeq() {
		return memberNo;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberNo = memberSeq;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getMarrySchedule() {
		return marrySchedule;
	}
	public void setMarrySchedule(Date marrySchedule) {
		this.marrySchedule = marrySchedule;
	}
	public int getExpectVisitor() {
		return expectVisitor;
	}
	public void setExpectVisitor(int expectVisitor) {
		this.expectVisitor = expectVisitor;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	
	
}
