package kr.co.member.model.vo;

import java.sql.Date;

public class MemberEnroll {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String fPhone;
	private String sPhone;
	private String tPhone;
	private String phone;
	private String birthDay;
	private String postNum;
	private String roadAddr;
	private String jibunAddr;
	private String extraAddr;
	private String detailAddr;
	private String email;
	private Date marrySchedule;
	private int expectVisitor;
	private int budget;
	public MemberEnroll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberEnroll(String memberId, String memberPw, String memberName, String fPhone, String sPhone,
			String tPhone, String phone, String birthDay, String postNum, String roadAddr, String jibunAddr,
			String extraAddr, String detailAddr, String email, Date marrySchedule, int expectVisitor, int budget) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.fPhone = fPhone;
		this.sPhone = sPhone;
		this.tPhone = tPhone;
		this.phone = phone;
		this.birthDay = birthDay;
		this.postNum = postNum;
		this.roadAddr = roadAddr;
		this.jibunAddr = jibunAddr;
		this.extraAddr = extraAddr;
		this.detailAddr = detailAddr;
		this.email = email;
		this.marrySchedule = marrySchedule;
		this.expectVisitor = expectVisitor;
		this.budget = budget;
	}
	@Override
	public String toString() {
		return "MemberEnroll [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", fPhone=" + fPhone + ", sPhone=" + sPhone + ", tPhone=" + tPhone + ", phone=" + phone
				+ ", birthDay=" + birthDay + ", postNum=" + postNum + ", roadAddr=" + roadAddr + ", jibunAddr="
				+ jibunAddr + ", extraAddr=" + extraAddr + ", detailAddr=" + detailAddr + ", email=" + email
				+ ", marrySchedule=" + marrySchedule + ", expectVisitor=" + expectVisitor + ", budget=" + budget + "]";
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
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getJibunAddr() {
		return jibunAddr;
	}
	public void setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
	}
	public String getExtraAddr() {
		return extraAddr;
	}
	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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

	

	
	
}