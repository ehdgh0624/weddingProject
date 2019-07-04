package kr.co.scrapbook.model.vo;

public class Scrapbook {
	private String memberId;
	private String code;
	private int prdNo;
	private String prdName;
	private String prdFilepath;
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
