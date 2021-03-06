package kr.co.member.model.vo;

import java.sql.Date;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String fPhone;
	private String sPhone;
	private String tPhone;
	private String phone;
	private String birthDay;
	private String email;
	private String addr;
	private Date marrySchedule;
	private int expectVisitor;
	private int budget;
	private Date enrollDate;
	private String memberCode;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int memberNo, String memberId, String memberPw, String memberName, String fPhone, String sPhone,
			String tPhone, String phone, String birthDay, String email, String addr, Date marrySchedule,
			int expectVisitor, int budget, Date enrollDate, String memberCode) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.fPhone = fPhone;
		this.sPhone = sPhone;
		this.tPhone = tPhone;
		this.phone = phone;
		this.birthDay = birthDay;
		this.email = email;
		this.addr = addr;
		this.marrySchedule = marrySchedule;
		this.expectVisitor = expectVisitor;
		this.budget = budget;
		this.enrollDate = enrollDate;
		this.memberCode = memberCode;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", fPhone=" + fPhone + ", sPhone=" + sPhone + ", tPhone=" + tPhone + ", phone=" + phone
				+ ", birthDay=" + birthDay + ", email=" + email + ", addr=" + addr + ", marrySchedule=" + marrySchedule
				+ ", expectVisitor=" + expectVisitor + ", budget=" + budget + ", enrollDate=" + enrollDate
				+ ", memberCode=" + memberCode + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public String getfPhone() {
		return fPhone;
	}
	public void setfPhone(String fPhone) {
		this.fPhone = fPhone;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public String gettPhone() {
		return tPhone;
	}
	public void settPhone(String tPhone) {
		this.tPhone = tPhone;
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
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	
	
	
	
	
}