package kr.co.goods.model.vo;

public class Goods {
	private int goodsNo;
	private String code;
	private String goodsType;
	private String goodsName;
	private int goodsPrice;
	private int goodsScope;
	private String goodsContent;
	private int viewstatus;
	private String goodsFileName;
	private String goodsFilePath;
	private String goodsTag;
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Goods(int goodsNo, String code, String goodsType, String goodsName, int goodsPrice, int goodsScope,
			String goodsContent, int viewstatus, String goodsFileName, String goodsFilePath, String goodsTag) {
		super();
		this.goodsNo = goodsNo;
		this.code = code;
		this.goodsType = goodsType;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsScope = goodsScope;
		this.goodsContent = goodsContent;
		this.viewstatus = viewstatus;
		this.goodsFileName = goodsFileName;
		this.goodsFilePath = goodsFilePath;
		this.goodsTag = goodsTag;
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
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
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
	public int getGoodsScope() {
		return goodsScope;
	}
	public void setGoodsScope(int goodsScope) {
		this.goodsScope = goodsScope;
	}
	public String getGoodsContent() {
		return goodsContent;
	}
	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}
	public int getViewstatus() {
		return viewstatus;
	}
	public void setViewstatus(int viewstatus) {
		this.viewstatus = viewstatus;
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
	public String getGoodsTag() {
		return goodsTag;
	}
	public void setGoodsTag(String goodsTag) {
		this.goodsTag = goodsTag;
	}
		
}
