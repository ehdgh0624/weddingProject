package kr.co.simulator.model.vo;

public class SimulatorSelect {
	
	private int simulatorNo;	//웨딩계산기 고유번호
	private String code;		//타입분류
	private int prdNo;			//업체번호, 상품번호
	private String prdName;		//업체명, 상품명
	private int prdPrice;		//업체(상품) 평균 금액
	private String prdTel;		//업체 연락처
	private String prdLoc;		//업체 주소
	private String prdTag;		//업체(상품) 검색 태그
	private String prdFilepath;	//업체 대표사진경로dd
	
	public SimulatorSelect() {
		super();
	}

	public SimulatorSelect(int simulatorNo, String code, int prdNo, String prdName, int prdPrice, String prdTel,
			String prdLoc, String prdTag, String prdFilepath) {
		super();
		this.simulatorNo = simulatorNo;
		this.code = code;
		this.prdNo = prdNo;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdTel = prdTel;
		this.prdLoc = prdLoc;
		this.prdTag = prdTag;
		this.prdFilepath = prdFilepath;
	}

	public int getSimulatorNo() {
		return simulatorNo;
	}

	public void setSimulatorNo(int simulatorNo) {
		this.simulatorNo = simulatorNo;
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

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public String getPrdTel() {
		return prdTel;
	}

	public void setPrdTel(String prdTel) {
		this.prdTel = prdTel;
	}

	public String getPrdLoc() {
		return prdLoc;
	}

	public void setPrdLoc(String prdLoc) {
		this.prdLoc = prdLoc;
	}

	public String getPrdTag() {
		return prdTag;
	}

	public void setPrdTag(String prdTag) {
		this.prdTag = prdTag;
	}

	public String getPrdFilepath() {
		return prdFilepath;
	}

	public void setPrdFilepath(String prdFilepath) {
		this.prdFilepath = prdFilepath;
	}
	
	
}
