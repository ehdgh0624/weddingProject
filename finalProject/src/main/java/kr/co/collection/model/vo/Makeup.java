package kr.co.collection.model.vo;

public class Makeup {
	private int makeupNo;					//메이크업 업체번호
	private String memberId;				//메이크업 업체아이디
	private String code;					//타입분휴(M)
	private String makeupName;				//메이크업 업체명
	private String makeupTel;				//메이크업 연락
	private String makeupLoc;				//메이크업 지역
	private String makeupAddr;				//메이크업 상세주소
	private int makeupBasicPrice;			//메이크업 신랑신부 메이크업 가격
	private int makeupParentPrice;			//메이크업 혼주 메이크업 가격
	private int makeupVisitorPrice;			//메이크업 하객 메이크업 가격
	private String makeupContent;			//메이크업 상세설명
	private String makeupFilename;			//메이크업 대표사진 이름
	private String makeupFilepath;			//메이크업 대표사진 경로
	private int status;						//업체신청(대기=0/허가=1/거절=2)
	private int viewstatus;					//업체노출상태(보임=0/숨김=1/보임신청=2/숨김신청=3)
	private int makeupScope;				//메이크업 별점
	private String makeupTag;				//메이크업 태그(샾(#)으로 시작해서 콤마(,)로 구분)
	private String makeupLatitude;			//위도
	private String makeupLongitud;			//경도
	public Makeup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Makeup(int makeupNo, String memberId, String code, String makeupName, String makeupTel, String makeupLoc,
			String makeupAddr, int makeupBasicPrice, int makeupParentPrice, int makeupVisitorPrice,
			String makeupContent, String makeupFilename, String makeupFilepath, int status, int viewstatus,
			int makeupScope, String makeupTag, String makeupLatitude, String makeupLongitud) {
		super();
		this.makeupNo = makeupNo;
		this.memberId = memberId;
		this.code = code;
		this.makeupName = makeupName;
		this.makeupTel = makeupTel;
		this.makeupLoc = makeupLoc;
		this.makeupAddr = makeupAddr;
		this.makeupBasicPrice = makeupBasicPrice;
		this.makeupParentPrice = makeupParentPrice;
		this.makeupVisitorPrice = makeupVisitorPrice;
		this.makeupContent = makeupContent;
		this.makeupFilename = makeupFilename;
		this.makeupFilepath = makeupFilepath;
		this.status = status;
		this.viewstatus = viewstatus;
		this.makeupScope = makeupScope;
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
	public String getMakeupContent() {
		return makeupContent;
	}
	public void setMakeupContent(String makeupContent) {
		this.makeupContent = makeupContent;
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
	public int getMakeupScope() {
		return makeupScope;
	}
	public void setMakeupScope(int makeupScope) {
		this.makeupScope = makeupScope;
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
	@Override
	public String toString() {
		return "Makeup [makeupNo=" + makeupNo + ", memberId=" + memberId + ", code=" + code + ", makeupName="
				+ makeupName + ", makeupTel=" + makeupTel + ", makeupLoc=" + makeupLoc + ", makeupAddr=" + makeupAddr
				+ ", makeupBasicPrice=" + makeupBasicPrice + ", makeupParentPrice=" + makeupParentPrice
				+ ", makeupVisitorPrice=" + makeupVisitorPrice + ", makeupContent=" + makeupContent
				+ ", makeupFilename=" + makeupFilename + ", makeupFilepath=" + makeupFilepath + ", status=" + status
				+ ", viewstatus=" + viewstatus + ", makeupScope=" + makeupScope + ", makeupTag=" + makeupTag
				+ ", makeupLatitude=" + makeupLatitude + ", makeupLongitud=" + makeupLongitud + "]";
	}
}
