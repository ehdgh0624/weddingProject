package kr.co.collection.model.vo;

public class Dress {

	private int dressNo;					//드레스 업체번호
	private String memberId;				//드레스 업체아이디
	private String code;					//타입분류(D)
	private String dressName;				//드레스 업체명
	private String dressTel;				//드레스 연락처
	private String dressTelFi;
	private String dressTelSe;
	private String dressTelth;
	private String postNum;
	private String roadAddr;
	private String jibunAddr;
	private String extraAddr;
	private String detailAddr;
	private String dressLoc;				//드레스 지역
	private String dressAddr;				//드레스 상세주소
	private int dressFittingPrice;			//드레스 피팅가격
	private int dressRentNum;				//드레스 대여가능 개수
	private int dressRentPrice;				//드레스 대여가격
	private int jewelryPrice;				//쥬얼리 대여가격
	private String dressContent;			//드레스 상세설명
	private String dressFittingTime;		//드레스 피팅 소요 시간
	private String dressMending;			//드레스 가봉 가능 여부
	private String dressParking;			//드레스 주차 가능 여부
	private String dressFilename;			//드레스 대표사진 이름
	private String dressFilepath;			//드레스 대표사진 경로
	private int status;						//업체신청(대기=0/허가=1/거절=2)
	private int viewstatus;					//업체노출상태(보임=0/숨김=1/보임신청=2/숨김신청=3)
	private int dressScope;					//드레스 별점
	private String dressTag;				//드레스 태그(샾(#)으로 시작해서 콤마(,)로 구분)
	private String dressLatitude;			//위도
	private String dressLongitud;			//경도
	
	
	@Override
	public String toString() {
		return "Dress [dressNo=" + dressNo + ", memberId=" + memberId + ", code=" + code + ", dressName=" + dressName
				+ ", dressTel=" + dressTel + ", dressLoc=" + dressLoc + ", dressAddr=" + dressAddr
				+ ", dressFittingPrice=" + dressFittingPrice + ", dressRentNum=" + dressRentNum + ", dressRentPrice="
				+ dressRentPrice + ", jewelryPrice=" + jewelryPrice + ", dressContent=" + dressContent
				+ ", dressFittingTime=" + dressFittingTime + ", dressMending=" + dressMending + ", dressParking="
				+ dressParking + ", dressFilename=" + dressFilename + ", dressFilepath=" + dressFilepath + ", status="
				+ status + ", viewstatus=" + viewstatus + ", dressScope=" + dressScope + ", dressTag=" + dressTag
				+ ", dressLatitude=" + dressLatitude + ", dressLongitud=" + dressLongitud + "]";
	}
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

	public String getDressTelFi() {
		return dressTelFi;
	}
	public void setDressTelFi(String dressTelFi) {
		this.dressTelFi = dressTelFi;
	}
	public String getDressTelSe() {
		return dressTelSe;
	}
	public void setDressTelSe(String dressTelSe) {
		this.dressTelSe = dressTelSe;
	}
	public String getDressTelth() {
		return dressTelth;
	}
	public void setDressTelth(String dressTelth) {
		this.dressTelth = dressTelth;
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
	
	
}
