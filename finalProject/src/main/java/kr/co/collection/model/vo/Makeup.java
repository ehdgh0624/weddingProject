package kr.co.collection.model.vo;

public class Makeup {
	private int makeupNo;
	private String code;
	private String makeupName;
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
	private String makeupLatitude;
	private String makeupLongitud;
	public Makeup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Makeup(int makeupNo, String code, String makeupName, String makeupTel, String makeupLoc, String makeupAddr,
			int makeupBasicPrice, int makeupParentPrice, int makeupVisitorPrice, String makeupFilename,
			String makeupFilepath, int status, int viewstatus, String makeupTag, String makeupLatitude,
			String makeupLongitud) {
		super();
		this.makeupNo = makeupNo;
		this.code = code;
		this.makeupName = makeupName;
		this.makeupTel = makeupTel;
		this.makeupLoc = makeupLoc;
		this.makeupAddr = makeupAddr;
		this.makeupBasicPrice = makeupBasicPrice;
		this.makeupParentPrice = makeupParentPrice;
		this.makeupVisitorPrice = makeupVisitorPrice;
		this.makeupFilename = makeupFilename;
		this.makeupFilepath = makeupFilepath;
		this.status = status;
		this.viewstatus = viewstatus;
		this.makeupTag = makeupTag;
		this.makeupLatitude = makeupLatitude;
		this.makeupLongitud = makeupLongitud;
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
	public String getMakeupLatitude() {
		return makeupLatitude;
	}
	public void setMakeupLatitude(String makeupLatitude) {
		this.makeupLatitude = makeupLatitude;
	}
	public String getMakeupLongitud() {
		return makeupLongitud;
	}
	public void setMakeupLongitud(String makeupLongitud) {
		this.makeupLongitud = makeupLongitud;
	}
	
}
