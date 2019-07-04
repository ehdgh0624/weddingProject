package kr.co.collection.model.vo;

import java.sql.Date;

public class Dress {
	private int dressNo;
	private String memberId;
	private String code;
	private String dressName;
	private String dressTel;
	private String dressLoc;
	private String dressAddr;
	private int dressFittingPrice;
	private int dressRentNum;
	private int dressRentPrice;
	private int jewelryPrice;
	private String dressContent;
	private String dressFittingTime;
	private String dressMending;
	private String dressParking;
	private String dressFilename;
	private String dressFilepath;
	private int status;
	private int viewstatus;
	private int dressScope;
	private String dressTag;
	private String dressLatitude;
	private String dressLongitud;
	public Dress() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dress(int dressNo, String memberId, String code, String dressName, String dressTel, String dressLoc,
			String dressAddr, int dressFittingPrice, int dressRentNum, int dressRentPrice, int jewelryPrice,
			String dressContent, String dressFittingTime, String dressMending, String dressParking,
			String dressFilename, String dressFilepath, int status, int viewstatus, int dressScope, String dressTag,
			String dressLatitude, String dressLongitud) {
		super();
		this.dressNo = dressNo;
		this.memberId = memberId;
		this.code = code;
		this.dressName = dressName;
		this.dressTel = dressTel;
		this.dressLoc = dressLoc;
		this.dressAddr = dressAddr;
		this.dressFittingPrice = dressFittingPrice;
		this.dressRentNum = dressRentNum;
		this.dressRentPrice = dressRentPrice;
		this.jewelryPrice = jewelryPrice;
		this.dressContent = dressContent;
		this.dressFittingTime = dressFittingTime;
		this.dressMending = dressMending;
		this.dressParking = dressParking;
		this.dressFilename = dressFilename;
		this.dressFilepath = dressFilepath;
		this.status = status;
		this.viewstatus = viewstatus;
		this.dressScope = dressScope;
		this.dressTag = dressTag;
		this.dressLatitude = dressLatitude;
		this.dressLongitud = dressLongitud;
	}
	public int getDressNo() {
		return dressNo;
	}
	public void setDressNo(int dressNo) {
		this.dressNo = dressNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDressName() {
		return dressName;
	}
	public void setDressName(String dressName) {
		this.dressName = dressName;
	}
	public String getDressTel() {
		return dressTel;
	}
	public void setDressTel(String dressTel) {
		this.dressTel = dressTel;
	}
	public String getDressLoc() {
		return dressLoc;
	}
	public void setDressLoc(String dressLoc) {
		this.dressLoc = dressLoc;
	}
	public String getDressAddr() {
		return dressAddr;
	}
	public void setDressAddr(String dressAddr) {
		this.dressAddr = dressAddr;
	}
	public int getDressFittingPrice() {
		return dressFittingPrice;
	}
	public void setDressFittingPrice(int dressFittingPrice) {
		this.dressFittingPrice = dressFittingPrice;
	}
	public int getDressRentNum() {
		return dressRentNum;
	}
	public void setDressRentNum(int dressRentNum) {
		this.dressRentNum = dressRentNum;
	}
	public int getDressRentPrice() {
		return dressRentPrice;
	}
	public void setDressRentPrice(int dressRentPrice) {
		this.dressRentPrice = dressRentPrice;
	}
	public int getJewelryPrice() {
		return jewelryPrice;
	}
	public void setJewelryPrice(int jewelryPrice) {
		this.jewelryPrice = jewelryPrice;
	}
	public String getDressContent() {
		return dressContent;
	}
	public void setDressContent(String dressContent) {
		this.dressContent = dressContent;
	}
	public String getDressFittingTime() {
		return dressFittingTime;
	}
	public void setDressFittingTime(String dressFittingTime) {
		this.dressFittingTime = dressFittingTime;
	}
	public String getDressMending() {
		return dressMending;
	}
	public void setDressMending(String dressMending) {
		this.dressMending = dressMending;
	}
	public String getDressParking() {
		return dressParking;
	}
	public void setDressParking(String dressParking) {
		this.dressParking = dressParking;
	}
	public String getDressFilename() {
		return dressFilename;
	}
	public void setDressFilename(String dressFilename) {
		this.dressFilename = dressFilename;
	}
	public String getDressFilepath() {
		return dressFilepath;
	}
	public void setDressFilepath(String dressFilepath) {
		this.dressFilepath = dressFilepath;
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
	public int getDressScope() {
		return dressScope;
	}
	public void setDressScope(int dressScope) {
		this.dressScope = dressScope;
	}
	public String getDressTag() {
		return dressTag;
	}
	public void setDressTag(String dressTag) {
		this.dressTag = dressTag;
	}
	public String getDressLatitude() {
		return dressLatitude;
	}
	public void setDressLatitude(String dressLatitude) {
		this.dressLatitude = dressLatitude;
	}
	public String getDressLongitud() {
		return dressLongitud;
	}
	public void setDressLongitud(String dressLongitud) {
		this.dressLongitud = dressLongitud;
	}
}
