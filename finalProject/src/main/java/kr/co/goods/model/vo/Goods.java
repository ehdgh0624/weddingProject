package kr.co.goods.model.vo;

public class Goods {
	private int goodsNo;
	private String code;
	private int goodsType;
	private String goodsName;
	private int goodsPrice;
	private int goodsStock;
	private String goodsContent;
	private String goodsFileName;
	private String goodsFilePath;
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Goods(int goodsNo, String code, int goodsType, String goodsName, int goodsPrice, int goodsStock,
			String goodsContent, String goodsFileName, String goodsFilePath) {
		super();
		this.goodsNo = goodsNo;
		this.code = code;
		this.goodsType = goodsType;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsStock = goodsStock;
		this.goodsContent = goodsContent;
		this.goodsFileName = goodsFileName;
		this.goodsFilePath = goodsFilePath;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(int goodsType) {
		this.goodsType = goodsType;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public String getGoodsFilePath() {
		return goodsFilePath;
	}
	public void setGoodsFilePath(String goodsFilePath) {
		this.goodsFilePath = goodsFilePath;
	}
	
}
