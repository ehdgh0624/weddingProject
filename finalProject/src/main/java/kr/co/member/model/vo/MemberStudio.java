package kr.co.member.model.vo;

import java.sql.Date;

public class MemberStudio extends Member{
	
	private int studioNo;
	private String code;
	private String studioName;
	private String studioTel;
	private String studioLoc;
	private String studioAddr;
	private int studioPrice;
	private String fileName;
	private String filePath;
	private int status;
	private int viewStatus;
	private String studioTag;
	
	
	
	public MemberStudio(int memberSeq, String memberId, String memberPw, String memberName, String phone,
			String birthDay, String addr, Date marrySchedule, int expectVisitor, int budget, Date enrollDate) {
		super(memberSeq, memberId, memberPw, memberName, phone, birthDay, addr, marrySchedule, expectVisitor, budget,
				enrollDate);
		// TODO Auto-generated constructor stub
	}
	public int getStudioNo() {
		return studioNo;
	}
	public void setStudioNo(int studioNo) {
		this.studioNo = studioNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStudioName() {
		return studioName;
	}
	public void setStudioName(String studioName) {
		this.studioName = studioName;
	}
	public String getStudioTel() {
		return studioTel;
	}
	public void setStudioTel(String studioTel) {
		this.studioTel = studioTel;
	}
	public String getStudioLoc() {
		return studioLoc;
	}
	public void setStudioLoc(String studioLoc) {
		this.studioLoc = studioLoc;
	}
	public String getStudioAddr() {
		return studioAddr;
	}
	public void setStudioAddr(String studioAddr) {
		this.studioAddr = studioAddr;
	}
	public int getStudioPrice() {
		return studioPrice;
	}
	public void setStudioPrice(int studioPrice) {
		this.studioPrice = studioPrice;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViewStatus() {
		return viewStatus;
	}
	public void setViewStatus(int viewStatus) {
		this.viewStatus = viewStatus;
	}
	public String getStudioTag() {
		return studioTag;
	}
	public void setStudioTag(String studioTag) {
		this.studioTag = studioTag;
	}
	public MemberStudio() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MemberStudio [studioNo=" + studioNo + ", code=" + code + ", studioName=" + studioName + ", studioTel="
				+ studioTel + ", studioLoc=" + studioLoc + ", studioAddr=" + studioAddr + ", studioPrice=" + studioPrice
				+ ", fileName=" + fileName + ", filePath=" + filePath + ", status=" + status + ", viewStatus="
				+ viewStatus + ", studioTag=" + studioTag + "]";
	}
	
	
	
}
