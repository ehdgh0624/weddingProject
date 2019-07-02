package kr.co.member.model.vo;

import java.sql.Date;

public class MemberMakup  extends Member{
	private int makeupNo;//메이크업 번호
	private String code; //메이크업 코드
	private String makeupName;//메이크업 이름
	private String makeupTel;
	private String makeupLoc;
	private String makeupAddr;
	private int makeupBasicPrice;
	private int makeupParentPrice;
	private int makeupVisitorPrice;
	private String makeupFilename;
	private String makeupFilepath;
	private int status;
	private int viewstatus;
	private String makeupTag;
	
	public MemberMakup(int memberSeq, String memberId, String memberPw, String memberName, String phone,
			String birthDay, String addr, String marrySchedule, int expectVisitor, int budget, Date enrollDate) {
		super(memberSeq, memberId, memberPw, memberName, phone, birthDay, addr, marrySchedule, expectVisitor, budget,
				enrollDate);
		// TODO Auto-generated constructor stub
	}
	public int getMakeupNo() {
		return makeupNo;
	}
	public void setMakeupNo(int makeupNo) {
		this.makeupNo = makeupNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMakeupName() {
		return makeupName;
	}
	public void setMakeupName(String makeupName) {
		this.makeupName = makeupName;
	}
	public String getMakeupTel() {
		return makeupTel;
	}
	public void setMakeupTel(String makeupTel) {
		this.makeupTel = makeupTel;
	}
	public String getMakeupLoc() {
		return makeupLoc;
	}
	public void setMakeupLoc(String makeupLoc) {
		this.makeupLoc = makeupLoc;
	}
	public String getMakeupAddr() {
		return makeupAddr;
	}
	public void setMakeupAddr(String makeupAddr) {
		this.makeupAddr = makeupAddr;
	}
	public int getMakeupBasicPrice() {
		return makeupBasicPrice;
	}
	public void setMakeupBasicPrice(int makeupBasicPrice) {
		this.makeupBasicPrice = makeupBasicPrice;
	}
	public int getMakeupParentPrice() {
		return makeupParentPrice;
	}
	public void setMakeupParentPrice(int makeupParentPrice) {
		this.makeupParentPrice = makeupParentPrice;
	}
	public int getMakeupVisitorPrice() {
		return makeupVisitorPrice;
	}
	public void setMakeupVisitorPrice(int makeupVisitorPrice) {
		this.makeupVisitorPrice = makeupVisitorPrice;
	}
	public String getMakeupFilename() {
		return makeupFilename;
	}
	public void setMakeupFilename(String makeupFilename) {
		this.makeupFilename = makeupFilename;
	}
	public String getMakeupFilepath() {
		return makeupFilepath;
	}
	public void setMakeupFilepath(String makeupFilepath) {
		this.makeupFilepath = makeupFilepath;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViewstatus() {
		return viewstatus;
	}
	public void setViewstatus(int viewstatus) {
		this.viewstatus = viewstatus;
	}
	public String getMakeupTag() {
		return makeupTag;
	}
	public void setMakeupTag(String makeupTag) {
		this.makeupTag = makeupTag;
	}
	@Override
	public String toString() {
		return "MemberMakup [makeupNo=" + makeupNo + ", code=" + code + ", makeupName=" + makeupName + ", makeupTel="
				+ makeupTel + ", makeupLoc=" + makeupLoc + ", makeupAddr=" + makeupAddr + ", makeupBasicPrice="
				+ makeupBasicPrice + ", makeupParentPrice=" + makeupParentPrice + ", makeupVisitorPrice="
				+ makeupVisitorPrice + ", makeupFilename=" + makeupFilename + ", makeupFilepath=" + makeupFilepath
				+ ", status=" + status + ", viewstatus=" + viewstatus + ", makeupTag=" + makeupTag + "]";
	}
	public MemberMakup() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	

}
