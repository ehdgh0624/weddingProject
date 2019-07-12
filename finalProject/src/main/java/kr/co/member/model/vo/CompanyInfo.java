package kr.co.member.model.vo;

public class CompanyInfo {
	//공통 사진과 해쉬태그
	private String companyName;//업체이름
	private String postNum;
	private String roadAddr;
	private String jibunAddr;
	private String detailAddr;
	private String extraAddr;
	private String companyAddr;//업체주소
	private String companyPhone;//업체전화번호
	private int code;//업체분류
	private String companyContent;
	private String companyLatitude;
	private String companyLongtitude;
	private String fileName; //파일명
	private String filePath; //파일경로설정
	private String hashTag;//태그명

	//스튜디오인경우 <주석처리된 변수는 ajax로 따로처리예정 다른디비에 들어가기때문>
	private int studioPrice;
	private String studioCamera;
	private String studioTime;
	
	//ajax로 바로 처리할 데이터
	private String studioOption;
	private String studioOptionPrice;
	private int studioOptionType;
	
	//드레스인경우
	private int dressFittingPrice;
	private String dressFittingTime;
				   
	private int dressRentNum;
	private int dressRentPrice;
	private int jewelryPrice;
	private String dressContent;
	
	private String dressMending;
	private String dressParking;
	//메이크업
	private int makeupBasicPrice;
	//메이크업체크박스
	private String makeupParent;
	private String makeupVisitor;
	
	//메이크업 옵션가격
	private int makeupParentPrice;
	private int makeupVisitorPrice;
	
	
	//홀옵션
	private String hallSelectName;
	private String hallSelectPerson;
	private String hallSelectTime;
	private int hallSelectPrice;
	private String hallSelectEtc;
	private int hallPrice;
	


	//홀
	private String hallType;
	private int hallMinPerson; // 최소홀인원
	private int hallMaxPerson; // 최대인원
	private String hallServiceFood;//식사여부 체크
	private String hallServiceAudio;//음악 제공 여부 체크
	private String hallServiceDrink;//주류제공여부
	private String hallServiceParking;//주차제공 여부
	private int hallFoodtype;
	private String hallFoodmenu;
	private int hallFoodprice;
	public CompanyInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CompanyInfo [companyName=" + companyName + ", postNum=" + postNum + ", roadAddr=" + roadAddr
				+ ", jibunAddr=" + jibunAddr + ", detailAddr=" + detailAddr + ", extraAddr=" + extraAddr
				+ ", companyAddr=" + companyAddr + ", companyPhone=" + companyPhone + ", code=" + code
				+ ", companyContent=" + companyContent + ", companyLatitude=" + companyLatitude + ", companyLongtitude="
				+ companyLongtitude + ", fileName=" + fileName + ", filePath=" + filePath + ", hashTag=" + hashTag
				+ ", studioPrice=" + studioPrice + ", studioCamera=" + studioCamera + ", studioTime=" + studioTime
				+ ", studioOption=" + studioOption + ", studioOptionPrice=" + studioOptionPrice + ", studioOptionType="
				+ studioOptionType + ", dressFittingPrice=" + dressFittingPrice + ", dressFittingTime="
				+ dressFittingTime + ", dressRentNum=" + dressRentNum + ", dressRentPrice=" + dressRentPrice
				+ ", jewelryPrice=" + jewelryPrice + ", dressContent=" + dressContent + ", dressMending=" + dressMending
				+ ", dressParking=" + dressParking + ", makeupBasicPrice=" + makeupBasicPrice + ", makeupParent="
				+ makeupParent + ", makeupVisitor=" + makeupVisitor + ", makeupParentPrice=" + makeupParentPrice
				+ ", makeupVisitorPrice=" + makeupVisitorPrice + ", hallSelectName=" + hallSelectName
				+ ", hallSelectPerson=" + hallSelectPerson + ", hallSelectTime=" + hallSelectTime + ", hallSelectPrice="
				+ hallSelectPrice + ", hallSelectEtc=" + hallSelectEtc + ", hallPrice=" + hallPrice + ", hallType="
				+ hallType + ", hallMinPerson=" + hallMinPerson + ", hallMaxPerson=" + hallMaxPerson
				+ ", hallServiceFood=" + hallServiceFood + ", hallServiceAudio=" + hallServiceAudio
				+ ", hallServiceDrink=" + hallServiceDrink + ", hallServiceParking=" + hallServiceParking
				+ ", hallFoodtype=" + hallFoodtype + ", hallFoodmenu=" + hallFoodmenu + ", hallFoodprice="
				+ hallFoodprice + "]";
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getJibunAddr() {
		return jibunAddr;
	}
	public void setJibunAddr(String jibunAddr) {
		this.jibunAddr = jibunAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getExtraAddr() {
		return extraAddr;
	}
	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCompanyContent() {
		return companyContent;
	}
	public void setCompanyContent(String companyContent) {
		this.companyContent = companyContent;
	}
	public String getCompanyLatitude() {
		return companyLatitude;
	}
	public void setCompanyLatitude(String companyLatitude) {
		this.companyLatitude = companyLatitude;
	}
	public String getCompanyLongtitude() {
		return companyLongtitude;
	}
	public void setCompanyLongtitude(String companyLongtitude) {
		this.companyLongtitude = companyLongtitude;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public int getStudioPrice() {
		return studioPrice;
	}
	public void setStudioPrice(int studioPrice) {
		this.studioPrice = studioPrice;
	}
	public String getStudioCamera() {
		return studioCamera;
	}
	public void setStudioCamera(String studioCamera) {
		this.studioCamera = studioCamera;
	}
	public String getStudioTime() {
		return studioTime;
	}
	public void setStudioTime(String studioTime) {
		this.studioTime = studioTime;
	}
	public String getStudioOption() {
		return studioOption;
	}
	public void setStudioOption(String studioOption) {
		this.studioOption = studioOption;
	}
	public String getStudioOptionPrice() {
		return studioOptionPrice;
	}
	public void setStudioOptionPrice(String studioOptionPrice) {
		this.studioOptionPrice = studioOptionPrice;
	}
	public int getStudioOptionType() {
		return studioOptionType;
	}
	public void setStudioOptionType(int studioOptionType) {
		this.studioOptionType = studioOptionType;
	}
	public int getDressFittingPrice() {
		return dressFittingPrice;
	}
	public void setDressFittingPrice(int dressFittingPrice) {
		this.dressFittingPrice = dressFittingPrice;
	}
	public String getDressFittingTime() {
		return dressFittingTime;
	}
	public void setDressFittingTime(String dressFittingTime) {
		this.dressFittingTime = dressFittingTime;
	}
	public int getDressRentNum() {
		return dressRentNum;
	}
	public void setDressRentNum(int dressRentNum) {
		this.dressRentNum = dressRentNum;
	}
	public int getDressRentPrice() {
		return dressRentPrice;
	}
	public void setDressRentPrice(int dressRentPrice) {
		this.dressRentPrice = dressRentPrice;
	}
	public int getJewelryPrice() {
		return jewelryPrice;
	}
	public void setJewelryPrice(int jewelryPrice) {
		this.jewelryPrice = jewelryPrice;
	}
	public String getDressContent() {
		return dressContent;
	}
	public void setDressContent(String dressContent) {
		this.dressContent = dressContent;
	}
	public String getDressMending() {
		return dressMending;
	}
	public void setDressMending(String dressMending) {
		this.dressMending = dressMending;
	}
	public String getDressParking() {
		return dressParking;
	}
	public void setDressParking(String dressParking) {
		this.dressParking = dressParking;
	}
	public int getMakeupBasicPrice() {
		return makeupBasicPrice;
	}
	public void setMakeupBasicPrice(int makeupBasicPrice) {
		this.makeupBasicPrice = makeupBasicPrice;
	}
	public String getMakeupParent() {
		return makeupParent;
	}
	public void setMakeupParent(String makeupParent) {
		this.makeupParent = makeupParent;
	}
	public String getMakeupVisitor() {
		return makeupVisitor;
	}
	public void setMakeupVisitor(String makeupVisitor) {
		this.makeupVisitor = makeupVisitor;
	}
	public int getMakeupParentPrice() {
		return makeupParentPrice;
	}
	public void setMakeupParentPrice(int makeupParentPrice) {
		this.makeupParentPrice = makeupParentPrice;
	}
	public int getMakeupVisitorPrice() {
		return makeupVisitorPrice;
	}
	public void setMakeupVisitorPrice(int makeupVisitorPrice) {
		this.makeupVisitorPrice = makeupVisitorPrice;
	}
	public String getHallSelectName() {
		return hallSelectName;
	}
	public void setHallSelectName(String hallSelectName) {
		this.hallSelectName = hallSelectName;
	}
	public String getHallSelectPerson() {
		return hallSelectPerson;
	}
	public void setHallSelectPerson(String hallSelectPerson) {
		this.hallSelectPerson = hallSelectPerson;
	}
	public String getHallSelectTime() {
		return hallSelectTime;
	}
	public void setHallSelectTime(String hallSelectTime) {
		this.hallSelectTime = hallSelectTime;
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
	public int getHallPrice() {
		return hallPrice;
	}
	public void setHallPrice(int hallPrice) {
		this.hallPrice = hallPrice;
	}
	public String getHallType() {
		return hallType;
	}
	public void setHallType(String hallType) {
		this.hallType = hallType;
	}
	public int getHallMinPerson() {
		return hallMinPerson;
	}
	public void setHallMinPerson(int hallMinPerson) {
		this.hallMinPerson = hallMinPerson;
	}
	public int getHallMaxPerson() {
		return hallMaxPerson;
	}
	public void setHallMaxPerson(int hallMaxPerson) {
		this.hallMaxPerson = hallMaxPerson;
	}
	public String getHallServiceFood() {
		return hallServiceFood;
	}
	public void setHallServiceFood(String hallServiceFood) {
		this.hallServiceFood = hallServiceFood;
	}
	public String getHallServiceAudio() {
		return hallServiceAudio;
	}
	public void setHallServiceAudio(String hallServiceAudio) {
		this.hallServiceAudio = hallServiceAudio;
	}
	public String getHallServiceDrink() {
		return hallServiceDrink;
	}
	public void setHallServiceDrink(String hallServiceDrink) {
		this.hallServiceDrink = hallServiceDrink;
	}
	public String getHallServiceParking() {
		return hallServiceParking;
	}
	public void setHallServiceParking(String hallServiceParking) {
		this.hallServiceParking = hallServiceParking;
	}
	public int getHallFoodtype() {
		return hallFoodtype;
	}
	public void setHallFoodtype(int hallFoodtype) {
		this.hallFoodtype = hallFoodtype;
	}
	public String getHallFoodmenu() {
		return hallFoodmenu;
	}
	public void setHallFoodmenu(String hallFoodmenu) {
		this.hallFoodmenu = hallFoodmenu;
	}
	public int getHallFoodprice() {
		return hallFoodprice;
	}
	public void setHallFoodprice(int hallFoodprice) {
		this.hallFoodprice = hallFoodprice;
	}
	
	
}
