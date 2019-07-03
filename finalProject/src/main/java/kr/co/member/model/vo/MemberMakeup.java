package kr.co.member.model.vo;

import java.sql.Date;

public class MemberMakeup  extends Member{
	private int makeupNo;//메이크업 번호
	private String makeupId;
	private String code; //메이크업 코드
	private String makeupName;//메이크업 이름
	private String makeupTel;
	private String makeupLoc;
	private String makeupAddr;
	private int makeupBasicPrice;
	private String makeupParent;
	private String makeupVisitor;
	private int makeupParentPrice;
	private int makeupVisitorPrice;
	private String makeupFilename;
	private String makeupFilepath;
	private int status;
	private int viewstatus;
	private String makeupTag;
	private String makeupLatitude;
	private String makeupLongtitude;

	
	
	

	public MemberMakeup(int makeupNo, String makeupId, String code, String makeupName, String makeupTel,
			String makeupLoc, String makeupAddr, int makeupBasicPrice, String makeupParent, String makeupVisitor,
			int makeupParentPrice, int makeupVisitorPrice, String makeupFilename, String makeupFilepath, int status,
			int viewstatus, String makeupTag, String makeupLatitude, String makeupLongtitude) {
		super();
		this.makeupNo = makeupNo;
		this.makeupId = makeupId;
		this.code = code;
		this.makeupName = makeupName;
		this.makeupTel = makeupTel;
		this.makeupLoc = makeupLoc;
		this.makeupAddr = makeupAddr;
		this.makeupBasicPrice = makeupBasicPrice;
		this.makeupParent = makeupParent;
		this.makeupVisitor = makeupVisitor;
		this.makeupParentPrice = makeupParentPrice;
		this.makeupVisitorPrice = makeupVisitorPrice;
		this.makeupFilename = makeupFilename;
		this.makeupFilepath = makeupFilepath;
		this.status = status;
		this.viewstatus = viewstatus;
		this.makeupTag = makeupTag;
		this.makeupLatitude = makeupLatitude;
		this.makeupLongtitude = makeupLongtitude;
	}

	public String getMakeupParent() {
		return makeupParent;
	}

	public void setMakeupParent(String makeupParent) {
		this.makeupParent = makeupParent;
	}

	public String getMakeupVisitor() {
		return makeupVisitor;
	}

	public void setMakeupVisitor(String makeupVisitor) {
		this.makeupVisitor = makeupVisitor;
	}

	public String getMakeupLatitude() {
		return makeupLatitude;
	}

	public void setMakeupLatitude(String makeupLatitude) {
		this.makeupLatitude = makeupLatitude;
	}

	@Override
	public String toString() {
		return "MemberMakeup [makeupNo=" + makeupNo + ", makeupId=" + makeupId + ", code=" + code + ", makeupName="
				+ makeupName + ", makeupTel=" + makeupTel + ", makeupLoc=" + makeupLoc + ", makeupAddr=" + makeupAddr
				+ ", makeupBasicPrice=" + makeupBasicPrice + ", makeupParentPrice=" + makeupParentPrice
				+ ", makeupVisitorPrice=" + makeupVisitorPrice + ", makeupFilename=" + makeupFilename
				+ ", makeupFilepath=" + makeupFilepath + ", status=" + status + ", viewstatus=" + viewstatus
				+ ", makeupTag=" + makeupTag + ", makeupLatitude=" + makeupLatitude + ", makeupLongtitude="
				+ makeupLongtitude + "]";
	}
	

	public MemberMakeup(int memberNo, String memberId, String memberPw, String memberName, String phone,
			String birthDay, String addr, Date marrySchedule, int expectVisitor, int budget, Date enrollDate,
			int memberCode) {
		super(memberNo, memberId, memberPw, memberName, phone, birthDay, addr, marrySchedule, expectVisitor, budget, enrollDate,
				memberCode);
		// TODO Auto-generated constructor stub
	}
	public String getMakeupId() {
		return makeupId;
	}
	public void setMakeupId(String makeupId) {
		this.makeupId = makeupId;
	}
	public MemberMakeup() {
		super();
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
	public String getHallLatitude() {
		return makeupLatitude;
	}
	public void setHallLatitude(String hallLatitude) {
		this.makeupLatitude = hallLatitude;
	}
	public String getMakeupLongtitude() {
		return makeupLongtitude;
	}
	public void setMakeupLongtitude(String makeupLongtitude) {
		this.makeupLongtitude = makeupLongtitude;
	}
	
}
