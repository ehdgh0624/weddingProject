package kr.co.collection.model.vo;

public class Studio {
	private int studioNo;					//스튜디오 업체번호
	private String memberId;				//스튜디오 업체아이디
	private String code;					//타입분류(S)
	private String studioName;				//스튜디오 업체명
	private String studioTel;				//스튜디오 연락처
	private String studioLoc;				//스튜디오 지역
	private String studioAddr;				//스튜디오 상세주소
	private int studioPrice;				//스튜디오 평균가
	private String studioContent;			//스튜디오 상세설명
	private String studioFilename;			//스튜디오 대표사진 이름
	private String studioFilepath;			//스튜디오 대표사진 경로
	private int status;						//업체신청(대기=0/허가=1/거절=2)
	private int viewstatus;					//업체노출상태(보임=0/숨김=1/보임신청=2/숨김신청=3)
	private int studioScope;				//스튜디오 별점 평균
	private String studioTag;				//스튜디오 태그(샾(#)으로 시작해서 콤마(,)로 구분)
	private String studioLatitude;			//위도
	private String studioLongitud;			//경도
	public Studio() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Studio(int studioNo, String memberId, String code, String studioName, String studioTel, String studioLoc,
			String studioAddr, int studioPrice, String studioContent, String studioFilename, String studioFilepath,
			int status, int viewstatus, int studioScope, String studioTag, String studioLatitude,
			String studioLongitud) {
		super();
		this.studioNo = studioNo;
		this.memberId = memberId;
		this.code = code;
		this.studioName = studioName;
		this.studioTel = studioTel;
		this.studioLoc = studioLoc;
		this.studioAddr = studioAddr;
		this.studioPrice = studioPrice;
		this.studioContent = studioContent;
		this.studioFilename = studioFilename;
		this.studioFilepath = studioFilepath;
		this.status = status;
		this.viewstatus = viewstatus;
		this.studioScope = studioScope;
		this.studioTag = studioTag;
		this.studioLatitude = studioLatitude;
		this.studioLongitud = studioLongitud;
	}
	public int getStudioNo() {
		return studioNo;
	}
	public void setStudioNo(int studioNo) {
		this.studioNo = studioNo;
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
	public String getStudioContent() {
		return studioContent;
	}
	public void setStudioContent(String studioContent) {
		this.studioContent = studioContent;
	}
	public String getStudioFilename() {
		return studioFilename;
	}
	public void setStudioFilename(String studioFilename) {
		this.studioFilename = studioFilename;
	}
	public String getStudioFilepath() {
		return studioFilepath;
	}
	public void setStudioFilepath(String studioFilepath) {
		this.studioFilepath = studioFilepath;
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
	public int getStudioScope() {
		return studioScope;
	}
	public void setStudioScope(int studioScope) {
		this.studioScope = studioScope;
	}
	public String getStudioTag() {
		return studioTag;
	}
	public void setStudioTag(String studioTag) {
		this.studioTag = studioTag;
	}
	public String getStudioLatitude() {
		return studioLatitude;
	}
	public void setStudioLatitude(String studioLatitude) {
		this.studioLatitude = studioLatitude;
	}
	public String getStudioLongitud() {
		return studioLongitud;
	}
	public void setStudioLongitud(String studioLongitud) {
		this.studioLongitud = studioLongitud;
	}
	
}
