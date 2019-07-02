package kr.co.collection.model.vo;

import java.sql.Date;

public class StudioSelect {
	private int studioNo;
	private String studioOption;
	private int studioOptionPrice;
	private Date studioOptionDate;
	private int studioOptionType;
	public StudioSelect() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudioSelect(int studioNo, String studioOption, int studioOptionPrice, Date studioOptionDate,
			int studioOptionType) {
		super();
		this.studioNo = studioNo;
		this.studioOption = studioOption;
		this.studioOptionPrice = studioOptionPrice;
		this.studioOptionDate = studioOptionDate;
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
	public Date getStudioOptionDate() {
		return studioOptionDate;
	}
	public void setStudioOptionDate(Date studioOptionDate) {
		this.studioOptionDate = studioOptionDate;
	}
	public int getStudioOptionType() {
		return studioOptionType;
	}
	public void setStudioOptionType(int studioOptionType) {
		this.studioOptionType = studioOptionType;
	}
	
}
