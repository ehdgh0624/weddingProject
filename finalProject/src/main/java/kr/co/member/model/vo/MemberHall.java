package kr.co.member.model.vo;
import java.sql.Date;

public class MemberHall  extends Member{
	private int hallNo;
	private String code;//홀코드
	private String hallName;//홀이름
	private String hallLoc;//홀지역
	private String hallAddr;//상세주소
	private String hallContent;//상세설명
	private String hallImg;//이미지
	private String hallPath;//이미지경로
	private int hallPrice;//홀 가격
	private int hallPerson; //홀인원
	private int hallScope; //웨딩홀병점
	private String hallFoodtype;//웨딩홀 음식타입
	private String hallFoodemenu; //웨딩홀 음식메뉴
	private String hallFoodprice;//음식가격
	private String hallTel;//웨딩홀 전화번호
	private String hallTime;//웨딩홀 운영시간
	private String hallServiceFood;//웨딩홀 식사제공
	private String hallServiceDrink;//웨딩홀 주류제공
	private String hallServicePark; //웨딩홀 주차
	private int status;//상태(0==대기 1==허가 2==거절)
	private int viewStatus;//뷰상태(0==노출상태 1==노출거부)
	private String hallTag;//태그명
	
	public MemberHall(int memberSeq, String memberId, String memberPw, String memberName, String phone, String birthDay,
			String addr, Date marrySchedule, int expectVisitor, int budget, Date enrollDate) {
		super(memberSeq, memberId, memberPw, memberName, phone, birthDay, addr, marrySchedule, expectVisitor, budget,
				enrollDate);
		// TODO Auto-generated constructor stub
	}
	public int getHallNo() {
		return hallNo;
	}
	public void setHallNo(int hallNo) {
		this.hallNo = hallNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getHallLoc() {
		return hallLoc;
	}
	public void setHallLoc(String hallLoc) {
		this.hallLoc = hallLoc;
	}
	public String getHallAddr() {
		return hallAddr;
	}
	public void setHallAddr(String hallAddr) {
		this.hallAddr = hallAddr;
	}
	public String getHallContent() {
		return hallContent;
	}
	public void setHallContent(String hallContent) {
		this.hallContent = hallContent;
	}
	public String getHallImg() {
		return hallImg;
	}
	public void setHallImg(String hallImg) {
		this.hallImg = hallImg;
	}
	public String getHallPath() {
		return hallPath;
	}
	public void setHallPath(String hallPath) {
		this.hallPath = hallPath;
	}
	public int getHallPrice() {
		return hallPrice;
	}
	public void setHallPrice(int hallPrice) {
		this.hallPrice = hallPrice;
	}
	public int getHallPerson() {
		return hallPerson;
	}
	public void setHallPerson(int hallPerson) {
		this.hallPerson = hallPerson;
	}
	public int getHallScope() {
		return hallScope;
	}
	public void setHallScope(int hallScope) {
		this.hallScope = hallScope;
	}
	public String getHallFoodtype() {
		return hallFoodtype;
	}
	public void setHallFoodtype(String hallFoodtype) {
		this.hallFoodtype = hallFoodtype;
	}
	public String getHallFoodemenu() {
		return hallFoodemenu;
	}
	public void setHallFoodemenu(String hallFoodemenu) {
		this.hallFoodemenu = hallFoodemenu;
	}
	public String getHallFoodprice() {
		return hallFoodprice;
	}
	public void setHallFoodprice(String hallFoodprice) {
		this.hallFoodprice = hallFoodprice;
	}
	public String getHallTel() {
		return hallTel;
	}
	public void setHallTel(String hallTel) {
		this.hallTel = hallTel;
	}
	public String getHallTime() {
		return hallTime;
	}
	public void setHallTime(String hallTime) {
		this.hallTime = hallTime;
	}
	public String getHallServiceFood() {
		return hallServiceFood;
	}
	public void setHallServiceFood(String hallServiceFood) {
		this.hallServiceFood = hallServiceFood;
	}
	public String getHallServiceDrink() {
		return hallServiceDrink;
	}
	public void setHallServiceDrink(String hallServiceDrink) {
		this.hallServiceDrink = hallServiceDrink;
	}
	public String getHallServicePark() {
		return hallServicePark;
	}
	public void setHallServicePark(String hallServicePark) {
		this.hallServicePark = hallServicePark;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViewStatus() {
		return viewStatus;
	}
	public void setViewStatus(int viewStatus) {
		this.viewStatus = viewStatus;
	}
	public String getHallTag() {
		return hallTag;
	}
	public void setHallTag(String hallTag) {
		this.hallTag = hallTag;
	}
	public MemberHall() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public MemberHall(int hallNo, String code, String hallName, String hallLoc, String hallAddr, String hallContent,
			String hallImg, String hallPath, int hallPrice, int hallPerson, int hallScope, String hallFoodtype,
			String hallFoodemenu, String hallFoodprice, String hallTel, String hallTime, String hallServiceFood,
			String hallServiceDrink, String hallServicePark, int status, int viewStatus, String hallTag) {
		super();
		this.hallNo = hallNo;
		this.code = code;
		this.hallName = hallName;
		this.hallLoc = hallLoc;
		this.hallAddr = hallAddr;
		this.hallContent = hallContent;
		this.hallImg = hallImg;
		this.hallPath = hallPath;
		this.hallPrice = hallPrice;
		this.hallPerson = hallPerson;
		this.hallScope = hallScope;
		this.hallFoodtype = hallFoodtype;
		this.hallFoodemenu = hallFoodemenu;
		this.hallFoodprice = hallFoodprice;
		this.hallTel = hallTel;
		this.hallTime = hallTime;
		this.hallServiceFood = hallServiceFood;
		this.hallServiceDrink = hallServiceDrink;
		this.hallServicePark = hallServicePark;
		this.status = status;
		this.viewStatus = viewStatus;
		this.hallTag = hallTag;
	}
	@Override
	public String toString() {
		return "MemberHall [hallNo=" + hallNo + ", code=" + code + ", hallName=" + hallName + ", hallLoc=" + hallLoc
				+ ", hallAddr=" + hallAddr + ", hallContent=" + hallContent + ", hallImg=" + hallImg + ", hallPath="
				+ hallPath + ", hallPrice=" + hallPrice + ", hallPerson=" + hallPerson + ", hallScope=" + hallScope
				+ ", hallFoodtype=" + hallFoodtype + ", hallFoodemenu=" + hallFoodemenu + ", hallFoodprice="
				+ hallFoodprice + ", hallTel=" + hallTel + ", hallTime=" + hallTime + ", hallServiceFood="
				+ hallServiceFood + ", hallServiceDrink=" + hallServiceDrink + ", hallServicePark=" + hallServicePark
				+ ", status=" + status + ", viewStatus=" + viewStatus + ", hallTag=" + hallTag + "]";
	}
	
	
	
	
}
