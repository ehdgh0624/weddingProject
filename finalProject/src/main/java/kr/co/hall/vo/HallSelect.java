package kr.co.hall.vo;

public class HallSelect {
	private int hallSelectNo;
	private String hallType;
	private int hallNo;
	private int hallSelectPrice;
	private String hallSelectEtc;

	public HallSelect() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HallSelect(int hallSelectNo, String hallType, int hallNo, int hallSelectPrice, String hallSelectEtc) {
		super();
		this.hallSelectNo = hallSelectNo;
		this.hallType = hallType;
		this.hallNo = hallNo;
		this.hallSelectPrice = hallSelectPrice;
		this.hallSelectEtc = hallSelectEtc;
	}

	public int getHallSelectNo() {
		return hallSelectNo;
	}

	public void setHallSelectNo(int hallSelectNo) {
		this.hallSelectNo = hallSelectNo;
	}

	public String getHallType() {
		return hallType;
	}

	public void setHallType(String hallType) {
		this.hallType = hallType;
	}

	public int getHallNo() {
		return hallNo;
	}

	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}

	public int getHallSelectPrice() {
		return hallSelectPrice;
	}

	public void setHallSelectPrice(int hallSelectPrice) {
		this.hallSelectPrice = hallSelectPrice;
	}

	public String getHallSelectEtc() {
		return hallSelectEtc;
	}

	public void setHallSelectEtc(String hallSelectEtc) {
		this.hallSelectEtc = hallSelectEtc;
	}

	@Override
	public String toString() {
		return "HallSelect [hallSelectNo=" + hallSelectNo + ", hallType=" + hallType + ", hallNo=" + hallNo
				+ ", hallSelectPrice=" + hallSelectPrice + ", hallSelectEtc=" + hallSelectEtc + "]";
	}

}
