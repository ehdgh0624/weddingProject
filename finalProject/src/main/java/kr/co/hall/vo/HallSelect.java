package kr.co.hall.vo;

public class HallSelect {
	private int hallSelectRef;
	private String hallSelectType;
	private int hallSelectPrice;
	private String hallSelectEtc;
	private String hallSelectName;

	public HallSelect() {
		super();
		// TODO Auto-generated constructor stub
	}


	public HallSelect(int hallSelectRef, String hallSelectType, int hallSelectPrice, String hallSelectEtc,
			String hallSelectName) {
		super();
		this.hallSelectRef = hallSelectRef;
		this.hallSelectType = hallSelectType;
		this.hallSelectPrice = hallSelectPrice;
		this.hallSelectEtc = hallSelectEtc;
		this.hallSelectName = hallSelectName;
	}



	public int getHallSelectRef() {
		return hallSelectRef;
	}

	public void setHallSelectRef(int hallSelectRef) {
		this.hallSelectRef = hallSelectRef;
	}

	public String getHallSelectType() {
		return hallSelectType;
	}

	public void setHallSelectType(String hallSelectType) {
		this.hallSelectType = hallSelectType;
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
	
	public String getHallSelectName() {
		return hallSelectName;
	}

	public void setHallSelectName(String hallSelectName) {
		this.hallSelectName = hallSelectName;
	}

	@Override
	public String toString() {
		return "HallSelect [hallSelectRef=" + hallSelectRef + ", hallSelectType=" + hallSelectType
				+ ", hallSelectPrice=" + hallSelectPrice + ", hallSelectEtc=" + hallSelectEtc + "]";
	}

}
