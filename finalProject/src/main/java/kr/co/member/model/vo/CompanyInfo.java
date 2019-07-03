package kr.co.member.model.vo;

public class CompanyInfo {
	private String companyName;//업체이름
	private String companyAddr;//업체주소
	private String companyPhone;//업체전화번호
	private int code;//업체분류
	
	//스튜디오인경우 <주석처리된 변수는 ajax로 따로처리예정 다른디비에 들어가기때문>
	private int studioPrice;
	
	//ajax로 바로 처리할 데이터
	private String studioOption;
	private String studioOptionPrice;
	private int studioOptionType;
	
	//드레스인경우
	private int dressFittingPrice;
	private int dressFiitngTime;
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
	
	
	//홀인경우
	private int hallType;
	private int hallPrice;
	private String hallServiceFood;//식사여부 체크
	private int hallFoodtype;
	private String hallFoodmenu;
	private int hallFoodprice;
	private int hallMinPerson;
	private int hallMaxPerson;
	
	private String hallStartTime;
	private String hallEndTime;
	
	private String hallServiceAudio;//음악 제공 여부 체크
	private String hallServiceDrink;//주류제공여부
	private String hallServiceParking;//주차제공 여부
	
	private String hallContent; //웨딩홀 상세설명
	
	//공통 사진과 해쉬태그
	private String fileName; //파일명
	private String filePath; //파일경로설정
	
	private String hashTag;//태그명
	

	public CompanyInfo(String companyName, String companyAddr, String companyPhone, int code, int studioPric,
			String studiOption, String studioOptionPrice, int studioOptionType, int dressFittingPrice, int dressRentNum,
			int dressRentPrice, int jewelryPrice, String dressContent, int dressFiitngTime, String dressMending,
			String dressParking, int makeupBasicPrice, String makeupParent, String makeupVisitor, int makeupParentPrice,
			int makeupVisitorPrice, int hallType, int hallPrice, String hallServiceFood, int hallFoodtype,
			String hallFoodmenu, int hallFoodprice, int hallMinPerson, int hallMaxPerson, String hallStartTime,
			String hallEndTime, String hallServiceAudio, String hallServiceDrink, String hallServiceParking,
			String hallContent, String fileName, String filePath, String hashTag) {
		super();
		this.companyName = companyName;
		this.companyAddr = companyAddr;
		this.companyPhone = companyPhone;
		this.code = code;
		this.studioPrice = studioPric;
		this.studioOption = studiOption;
		this.studioOptionPrice = studioOptionPrice;
		this.studioOptionType = studioOptionType;
		this.dressFittingPrice = dressFittingPrice;
		this.dressRentNum = dressRentNum;
		this.dressRentPrice = dressRentPrice;
		this.jewelryPrice = jewelryPrice;
		this.dressContent = dressContent;
		this.dressFiitngTime = dressFiitngTime;
		this.dressMending = dressMending;
		this.dressParking = dressParking;
		this.makeupBasicPrice = makeupBasicPrice;
		this.makeupParent = makeupParent;
		this.makeupVisitor = makeupVisitor;
		this.makeupParentPrice = makeupParentPrice;
		this.makeupVisitorPrice = makeupVisitorPrice;
		this.hallType = hallType;
		this.hallPrice = hallPrice;
		this.hallServiceFood = hallServiceFood;
		this.hallFoodtype = hallFoodtype;
		this.hallFoodmenu = hallFoodmenu;
		this.hallFoodprice = hallFoodprice;
		this.hallMinPerson = hallMinPerson;
		this.hallMaxPerson = hallMaxPerson;
		this.hallStartTime = hallStartTime;
		this.hallEndTime = hallEndTime;
		this.hallServiceAudio = hallServiceAudio;
		this.hallServiceDrink = hallServiceDrink;
		this.hallServiceParking = hallServiceParking;
		this.hallContent = hallContent;
		this.fileName = fileName;
		this.filePath = filePath;
		this.hashTag = hashTag;
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

	public int getDressFiitngTime() {
		return dressFiitngTime;
	}


	public void setDressFiitngTime(int dressFiitngTime) {
		this.dressFiitngTime = dressFiitngTime;
	}


	public String getDressContent() {
		return dressContent;
	}


	public void setDressContent(String dressContent) {
		this.dressContent = dressContent;
	}

	public int getJewelryPrice() {
		return jewelryPrice;
	}


	public void setJewelryPrice(int jewelryPrice) {
		this.jewelryPrice = jewelryPrice;
	}


	public int getDressRentPrice() {
		return dressRentPrice;
	}


	public void setDressRentPrice(int dressRentPrice) {
		this.dressRentPrice = dressRentPrice;
	}


	public CompanyInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public int getStudioPrice() {
		return studioPrice;
	}

	public void setStudioPric(int studioPrice) {
		this.studioPrice = studioPrice;
	}

	public String getStudioOption() {
		return studioOption;
	}

	public void setStudioOption(String studiOption) {
		this.studioOption = studiOption;
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

	public int getDressRentNum() {
		return dressRentNum;
	}

	public void setDressRentNum(int dressRentNum) {
		this.dressRentNum = dressRentNum;
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

	public int getHallType() {
		return hallType;
	}

	public void setHallType(int hallType) {
		this.hallType = hallType;
	}

	public int getHallPrice() {
		return hallPrice;
	}

	public void setHallPrice(int hallPrice) {
		this.hallPrice = hallPrice;
	}

	public String getHallServiceFood() {
		return hallServiceFood;
	}

	public void setHallServiceFood(String hallServiceFood) {
		this.hallServiceFood = hallServiceFood;
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

	public String getHallStartTime() {
		return hallStartTime;
	}

	public void setHallStartTime(String hallStartTime) {
		this.hallStartTime = hallStartTime;
	}

	public String getHallEndTime() {
		return hallEndTime;
	}

	public void setHallEndTime(String hallEndTime) {
		this.hallEndTime = hallEndTime;
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

	public String getHallContent() {
		return hallContent;
	}

	public void setHallContent(String hallContent) {
		this.hallContent = hallContent;
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

	
	
}
