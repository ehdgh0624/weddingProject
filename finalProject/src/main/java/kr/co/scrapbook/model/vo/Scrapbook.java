package kr.co.scrapbook.model.vo;

public class Scrapbook {
	private String memberId;				//회원 아이디
	private String code;					//타입분류
	private int prdNo;						//업체번호, 상품번호
	private String prdName;					//업체명, 상품명
	private String prdFilepath;				//업체 대표사진 경로
	public Scrapbook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Scrapbook(String memberId, String code, int prdNo, String prdName, String prdFilepath) {
		super();
		this.memberId = memberId;
		this.code = code;
		this.prdNo = prdNo;
		this.prdName = prdName;
		this.prdFilepath = prdFilepath;
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
	public int getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public String getPrdFilepath() {
		return prdFilepath;
	}
	public void setPrdFilepath(String prdFilepath) {
		this.prdFilepath = prdFilepath;
	}
}
