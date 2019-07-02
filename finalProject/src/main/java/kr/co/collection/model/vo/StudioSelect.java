package kr.co.collection.model.vo;

import java.sql.Date;

public class StudioSelect {
	private int studioNo;
	private String studioOption;
	private int studioOptionPrice;
	private int studioOptionType;
	public StudioSelect() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudioSelect(int studioNo, String studioOption, int studioOptionPrice, int studioOptionType) {
		super();
		this.studioNo = studioNo;
		this.studioOption = studioOption;
		this.studioOptionPrice = studioOptionPrice;
		this.studioOptionType = studioOptionType;
	}
	public int getStudioNo() {
		return studioNo;
	}
	public void setStudioNo(int studioNo) {
		this.studioNo = studioNo;
	}
	public String getStudioOption() {
		return studioOption;
	}
	public void setStudioOption(String studioOption) {
		this.studioOption = studioOption;
	}
	public int getStudioOptionPrice() {
		return studioOptionPrice;
	}
	public void setStudioOptionPrice(int studioOptionPrice) {
		this.studioOptionPrice = studioOptionPrice;
	}
	public int getStudioOptionType() {
		return studioOptionType;
	}
	public void setStudioOptionType(int studioOptionType) {
		this.studioOptionType = studioOptionType;
	}
}
