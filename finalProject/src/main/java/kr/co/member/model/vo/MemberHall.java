//package kr.co.member.model.vo;
//import java.sql.Date;
//
//public class MemberHall extends Member{
//	private int hallNo;
//	private String hallId;
//	private String code;//홀코드
//	private int hall_type;//홀 타입
//	private String hallName;//홀이름
//	private String hallLoc;//홀지역
//	private String hallAddr;//상세주소
//	private String hallContent;//상세설명
//	private String hallImg;//이미지
//	private String hallPath;//이미지경로
//	private int hallPrice;//홀 가격
//	private int hallMinPerson; //최소홀인원
//	private int hallMaxPerson; //최대인원
//	private int hall_scope;//홀별점
//	private int hallFoodtype;//웨딩홀 음식타입
//	private String hallFoodmenu; //웨딩홀 음식메뉴
//	private int hallFoodprice;//음식가격
//	private String hallTel;//웨딩홀 전화번호
//	private String hallTime;//웨딩홀 운영시간
//	private String hallServiceFood;//웨딩홀 식사제공
//	private String hall_ServiceAudio;//음향제공
//	private String hallServiceDrink;//웨딩홀 주류제공
//	private String hallServicePark; //웨딩홀 주차
//	private int status;//상태(0==대0 1==허가 2==거절)
//	private int viewStatus;//뷰상태(0==노출상태 1==노출거부)
//	private String hallTag;
//	private String hallLatitude;
//	private String hallLongtitude;
//	
//
//	@Override
//	public String toString() {
//		return "MemberHall [hallNo=" + hallNo + ", hallId=" + hallId + ", code=" + code + ", hallName=" + hallName
//				+ ", hallLoc=" + hallLoc + ", hallAddr=" + hallAddr + ", hallContent=" + hallContent + ", hallImg="
//				+ hallImg + ", hallPath=" + hallPath + ", hallPrice=" + hallPrice + ", hallMinPerson=" + hallMinPerson
//				+ ", hallMaxPerson=" + hallMaxPerson + ", hallFoodtype=" + hallFoodtype + ", hallFoodmenu="
//				+ hallFoodmenu + ", hallFoodprice=" + hallFoodprice + ", hallTel=" + hallTel + ", hallTime=" + hallTime
//				+ ", hallServiceFood=" + hallServiceFood + ", hallServiceDrink=" + hallServiceDrink
//				+ ", hallServicePark=" + hallServicePark + ", status=" + status + ", viewStatus=" + viewStatus
//				+ ", hallTag=" + hallTag + ", hallLatitude=" + hallLatitude + ", hallLongtitude=" + hallLongtitude
//				+ "]";
//	}
//
//	public MemberHall(int hallNo, String hallId, String code, String hallName, String hallLoc, String hallAddr,
//			String hallContent, String hallImg, String hallPath, int hallPrice, int hallMinPerson, int hallMaxPerson,
//			int hallFoodtype, String hallFoodmenu, int hallFoodprice, String hallTel, String hallTime,
//			String hallServiceFood, String hallServiceDrink, String hallServicePark, int status, int viewStatus,
//			String hallTag, String hallLatitude, String hallLongtitude) {
//		super();
//		this.hallNo = hallNo;
//		this.hallId = hallId;
//		this.code = code;
//		this.hallName = hallName;
//		this.hallLoc = hallLoc;
//		this.hallAddr = hallAddr;
//		this.hallContent = hallContent;
//		this.hallImg = hallImg;
//		this.hallPath = hallPath;
//		this.hallPrice = hallPrice;
//		this.hallMinPerson = hallMinPerson;
//		this.hallMaxPerson = hallMaxPerson;
//		this.hallFoodtype = hallFoodtype;
//		this.hallFoodmenu = hallFoodmenu;
//		this.hallFoodprice = hallFoodprice;
//		this.hallTel = hallTel;
//		this.hallTime = hallTime;
//		this.hallServiceFood = hallServiceFood;
//		this.hallServiceDrink = hallServiceDrink;
//		this.hallServicePark = hallServicePark;
//		this.status = status;
//		this.viewStatus = viewStatus;
//		this.hallTag = hallTag;
//		this.hallLatitude = hallLatitude;
//		this.hallLongtitude = hallLongtitude;
//	}
//
//	public String getHallId() {
//		return hallId;
//	}
//
//	public void setHallId(String hallId) {
//		this.hallId = hallId;
//	}
//
//	public String getHallTag() {
//		return hallTag;
//	}
//
//	public void setHallTag(String hallTag) {
//		this.hallTag = hallTag;
//	}
//
//	public String getHallLatitude() {
//		return hallLatitude;
//	}
//
//	public void setHallLatitude(String hallLatitude) {
//		this.hallLatitude = hallLatitude;
//	}
//
//	public String getHallLongtitude() {
//		return hallLongtitude;
//	}
//
//	public void setHallLongtitude(String hallLongtitude) {
//		this.hallLongtitude = hallLongtitude;
//	}
//
//	public MemberHall() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//
//
//
//	public int getHallNo() {
//		return hallNo;
//	}
//	public void setHallNo(int hallNo) {
//		this.hallNo = hallNo;
//	}
//	public String getCode() {
//		return code;
//	}
//	public void setCode(String code) {
//		this.code = code;
//	}
//	public String getHallName() {
//		return hallName;
//	}
//	public void setHallName(String hallName) {
//		this.hallName = hallName;
//	}
//	public String getHallLoc() {
//		return hallLoc;
//	}
//	public void setHallLoc(String hallLoc) {
//		this.hallLoc = hallLoc;
//	}
//	public String getHallAddr() {
//		return hallAddr;
//	}
//	public void setHallAddr(String hallAddr) {
//		this.hallAddr = hallAddr;
//	}
//	public String getHallContent() {
//		return hallContent;
//	}
//	public void setHallContent(String hallContent) {
//		this.hallContent = hallContent;
//	}
//	public String getHallImg() {
//		return hallImg;
//	}
//	public void setHallImg(String hallImg) {
//		this.hallImg = hallImg;
//	}
//	public String getHallPath() {
//		return hallPath;
//	}
//	public void setHallPath(String hallPath) {
//		this.hallPath = hallPath;
//	}
//	public int getHallPrice() {
//		return hallPrice;
//	}
//	public void setHallPrice(int hallPrice) {
//		this.hallPrice = hallPrice;
//	}
//	public int getHallMinPerson() {
//		return hallMinPerson;
//	}
//	public void setHallMinPerson(int hallMinPerson) {
//		this.hallMinPerson = hallMinPerson;
//	}
//	public int getHallMaxPerson() {
//		return hallMaxPerson;
//	}
//	public void setHallMaxPerson(int hallMaxPerson) {
//		this.hallMaxPerson = hallMaxPerson;
//	}
//
//	public int getHallFoodtype() {
//		return hallFoodtype;
//	}
//	public void setHallFoodtype(int hallFoodtype) {
//		this.hallFoodtype = hallFoodtype;
//	}
//	public String getHallFoodmenu() {
//		return hallFoodmenu;
//	}
//	public void setHallFoodmenu(String hallFoodmenu) {
//		this.hallFoodmenu = hallFoodmenu;
//	}
//	public int getHallFoodprice() {
//		return hallFoodprice;
//	}
//	public void setHallFoodprice(int hallFoodprice) {
//		this.hallFoodprice = hallFoodprice;
//	}
//	public String getHallTel() {
//		return hallTel;
//	}
//	public void setHallTel(String hallTel) {
//		this.hallTel = hallTel;
//	}
//	public String getHallTime() {
//		return hallTime;
//	}
//	public void setHallTime(String hallTime) {
//		this.hallTime = hallTime;
//	}
//	public String getHallServiceFood() {
//		return hallServiceFood;
//	}
//	public void setHallServiceFood(String hallServiceFood) {
//		this.hallServiceFood = hallServiceFood;
//	}
//	public String getHallServiceDrink() {
//		return hallServiceDrink;
//	}
//	public void setHallServiceDrink(String hallServiceDrink) {
//		this.hallServiceDrink = hallServiceDrink;
//	}
//	public String getHallServicePark() {
//		return hallServicePark;
//	}
//	public void setHallServicePark(String hallServicePark) {
//		this.hallServicePark = hallServicePark;
//	}
//	public int getStatus() {
//		return status;
//	}
//	public void setStatus(int status) {
//		this.status = status;
//	}
//	public int getViewStatus() {
//		return viewStatus;
//	}
//	public void setViewStatus(int viewStatus) {
//		this.viewStatus = viewStatus;
//	}
//}
