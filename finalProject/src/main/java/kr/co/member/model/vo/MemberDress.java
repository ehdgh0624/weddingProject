//package kr.co.member.model.vo;
//
//import java.sql.Date;
//
//public class MemberDress extends Member{
//	private int dressNo;
//	private String dressId;
//	private String code;
//	private String dressName;
//	private String dressTel;
//	private String dressLoc;
//	private String dressAddr;
//	private int dressFittingPrice;
//	private int dressRentNum;
//	private int dressRentPrice;
//	private int jewelryPrice;
//	private String dressContent;
//	private int dressFittingTime;
//	private String dressMending;
//	private String dressParking;
//	private String dressFileName;
//	private String dressFilePath;
//	private int status;
//	private int viewStatus;
//	private String dressTag;
//	private String dressLatitude;
//	private String dressLongtitude;
//	private int dressScope;
//	
//
//	@Override
//	public String toString() {
//		return "MemberDress [dressNo=" + dressNo + ", dressId=" + dressId + ", code=" + code + ", dressName="
//				+ dressName + ", dressTel=" + dressTel + ", dressLoc=" + dressLoc + ", dressAddr=" + dressAddr
//				+ ", dressFittingPrice=" + dressFittingPrice + ", dressRentNum=" + dressRentNum + ", dressRentPrice="
//				+ dressRentPrice + ", jewelryPrice=" + jewelryPrice + ", dressContent=" + dressContent
//				+ ", dressFittingTime=" + dressFittingTime + ", dressMending=" + dressMending + ", dressParking="
//				+ dressParking + ", dressFileName=" + dressFileName + ", dressFilePath=" + dressFilePath + ", status="
//				+ status + ", viewStatus=" + viewStatus + ", dressTag=" + dressTag + ", dressLatitude=" + dressLatitude
//				+ ", dressLongtitude=" + dressLongtitude + "]";
//	}
//	public MemberDress(int dressNo, String dressId, String code, String dressName, String dressTel, String dressLoc,
//			String dressAddr, int dressFittingPrice, int dressRentNum, int dressRentPrice, int jewelryPrice,
//			String dressContent, int dressFittingTime, String dressMending, String dressParking,
//			String dressFileName, String dressFilePath, int status, int viewStatus, String dressTag,
//			String dressLatitude, String dressLongtitude) {
//		super();
//		this.dressNo = dressNo;
//		this.dressId = dressId;
//		this.code = code;
//		this.dressName = dressName;
//		this.dressTel = dressTel;
//		this.dressLoc = dressLoc;
//		this.dressAddr = dressAddr;
//		this.dressFittingPrice = dressFittingPrice;
//		this.dressRentNum = dressRentNum;
//		this.dressRentPrice = dressRentPrice;
//		this.jewelryPrice = jewelryPrice;
//		this.dressContent = dressContent;
//		this.dressFittingTime = dressFittingTime;
//		this.dressMending = dressMending;
//		this.dressParking = dressParking;
//		this.dressFileName = dressFileName;
//		this.dressFilePath = dressFilePath;
//		this.status = status;
//		this.viewStatus = viewStatus;
//		this.dressTag = dressTag;
//		this.dressLatitude = dressLatitude;
//		this.dressLongtitude = dressLongtitude;
//	}
//
//	
//	public String getDressId() {
//		return dressId;
//	}
//	public void setDressId(String dressId) {
//		this.dressId = dressId;
//	}
//	public String getDressLatitude() {
//		return dressLatitude;
//	}
//	public void setDressLatitude(String dressLatitude) {
//		this.dressLatitude = dressLatitude;
//	}
//	public String getDressLongtitude() {
//		return dressLongtitude;
//	}
//	public void setDressLongtitude(String dressLongtitude) {
//		this.dressLongtitude = dressLongtitude;
//	}
//	public MemberDress() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//	public int getDressNo() {
//		return dressNo;
//	}
//	public void setDressNo(int dressNo) {
//		this.dressNo = dressNo;
//	}
//	public String getCode() {
//		return code;
//	}
//	public void setCode(String code) {
//		this.code = code;
//	}
//	public String getDressName() {
//		return dressName;
//	}
//	public void setDressName(String dressName) {
//		this.dressName = dressName;
//	}
//	public String getDressTel() {
//		return dressTel;
//	}
//	public void setDressTel(String dressTel) {
//		this.dressTel = dressTel;
//	}
//	public String getDressLoc() {
//		return dressLoc;
//	}
//	public void setDressLoc(String dressLoc) {
//		this.dressLoc = dressLoc;
//	}
//	public String getDressAddr() {
//		return dressAddr;
//	}
//	public void setDressAddr(String dressAddr) {
//		this.dressAddr = dressAddr;
//	}
//	public int getDressFittingPrice() {
//		return dressFittingPrice;
//	}
//	public void setDressFittingPrice(int dressFittingPrice) {
//		this.dressFittingPrice = dressFittingPrice;
//	}
//
//	public int getDressRentNum() {
//		return dressRentNum;
//	}
//	public void setDressRentNum(int dressRentNum) {
//		this.dressRentNum = dressRentNum;
//	}
//	public int getDressRentPrice() {
//		return dressRentPrice;
//	}
//	public void setDressRentPrice(int dressRentPrice) {
//		this.dressRentPrice = dressRentPrice;
//	}
//	public int getJewelryPrice() {
//		return jewelryPrice;
//	}
//	public void setJewelryPrice(int jewelryPrice) {
//		this.jewelryPrice = jewelryPrice;
//	}
//	public String getDressContent() {
//		return dressContent;
//	}
//	public void setDressContent(String dressContent) {
//		this.dressContent = dressContent;
//	}
//	public int getDressFittingTime() {
//		return dressFittingTime;
//	}
//	public void setDressFittingTime(int dressFittingTime) {
//		this.dressFittingTime = dressFittingTime;
//	}
//	public String getDressMending() {
//		return dressMending;
//	}
//	public void setDressMending(String dressMending) {
//		this.dressMending = dressMending;
//	}
//	public String getDressParking() {
//		return dressParking;
//	}
//	public void setDressParking(String dressParking) {
//		this.dressParking = dressParking;
//	}
//	public String getDressFileName() {
//		return dressFileName;
//	}
//	public void setDressFileName(String dressFileName) {
//		this.dressFileName = dressFileName;
//	}
//	public String getDressFilePath() {
//		return dressFilePath;
//	}
//	public void setDressFilePath(String dressFilePath) {
//		this.dressFilePath = dressFilePath;
//	}
//	public int getStatus() {
//		return status;
//	}
//	public void setStatus(int status) {
//		this.status = status;
//	}
//	public int getViewStatus() {
//		return viewStatus;
//	}
//	public void setViewStatus(int viewStatus) {
//		this.viewStatus = viewStatus;
//	}
//	public String getDressTag() {
//		return dressTag;
//	}
//	public void setDressTag(String dressTag) {
//		this.dressTag = dressTag;
//	}
//}
