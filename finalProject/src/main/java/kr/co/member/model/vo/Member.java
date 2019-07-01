package kr.co.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberSeq;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String birthDay;
	private String addr;
	private String marrySchedule;
	private int expectVisitor;
	private int budget;
	private Date enrollDate;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}
	public Member(int memberSeq ,String memberId, String memberPw, String memberName, String phone, String birthDay, String addr,
			String marrySchedule, int expectVisitor, int budget, Date enrollDate) {
		super();
		this.memberSeq =memberSeq;
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
	public String getMarrySchedule() {
		return marrySchedule;
	}
	public void setMarrySchedule(String marrySchedule) {
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
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", phone="
				+ phone + ", birthDay=" + birthDay + ", addr=" + addr + ", marrySchedule=" + marrySchedule
				+ ", expectVisitor=" + expectVisitor + ", budget=" + budget + ", enrollDate=" + enrollDate + "]";
	}
	
	
	
}
