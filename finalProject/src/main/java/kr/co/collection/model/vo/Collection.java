package kr.co.collection.model.vo;

public class Collection {
	//공통 변수
	private int objectNo;					//업체번호, 상품번호
	private String code;					//타입분류(S,D,M,G)
	private String memberId;				//업체아이디
	private String prdName;					//업체명,상품명
	private String prdAddr;					//업체주소
	private String tel;						//연락처
	private String loc;						//지역
	private int status;						//업체신청(대기=0/허가=1/거절=2)
	private int viewstatus;					//업체노출상태(보임=0/숨김=1/보임신청=2/숨김신청=3)
	private String latitude;				//위도
	private String longitud;				//경도
	private String tag;						//태그
	private int scope;						//별점
	private String fileName;				//사진 이름
	private String filePath;				//사진 경로
	private String content;					//상세설명
	private String goodsType;				//상품 타입(B,I)
	public Collection() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Collection(int objectNo, String code, String memberId, String prdName, String prdAddr, String tel,
			String loc, int status, int viewstatus, String latitude, String longitud, String tag, int scope,
			String fileName, String filePath, String content, String goodsType) {
		super();
		this.objectNo = objectNo;
		this.code = code;
		this.memberId = memberId;
		this.prdName = prdName;
		this.prdAddr = prdAddr;
		this.tel = tel;
		this.loc = loc;
		this.status = status;
		this.viewstatus = viewstatus;
		this.latitude = latitude;
		this.longitud = longitud;
		this.tag = tag;
		this.scope = scope;
		this.fileName = fileName;
		this.filePath = filePath;
		this.content = content;
		this.goodsType = goodsType;
	}
	public int getObjectNo() {
		return objectNo;
	}
	public void setObjectNo(int objectNo) {
		this.objectNo = objectNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getPrdAddr() {
		return prdAddr;
	}
	public void setPrdAddr(String prdAddr) {
		this.prdAddr = prdAddr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
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
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitud() {
		return longitud;
	}
	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getScope() {
		return scope;
	}
	public void setScope(int scope) {
		this.scope = scope;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	@Override
	public String toString() {
		return "Collection [objectNo=" + objectNo + ", code=" + code + ", memberId=" + memberId + ", prdName=" + prdName
				+ ", prdAddr=" + prdAddr + ", tel=" + tel + ", loc=" + loc + ", status=" + status + ", viewstatus="
				+ viewstatus + ", latitude=" + latitude + ", longitud=" + longitud + ", tag=" + tag + ", scope=" + scope
				+ ", fileName=" + fileName + ", filePath=" + filePath + ", content=" + content + ", goodsType="
				+ goodsType + "]";
	}
	
}
