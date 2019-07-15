package kr.co.member.model.vo;

public class CompanyInfo {
	//공통 사진과 해쉬태그
	private String companyName;//업체이름 //33번줄<input type="text" name="companyName" value=" ">
	private String postNum; //우편번호//38번째줄//우편번호" name="postNum
	private String roadAddr; //도로명주소 //50번째줄 placeholder="도로명주소" name="roadAddr
	private String companyLatitude; //위도 //43번째줄<input type="hidden" name="companyLatitude" id="shopLatitude">
	private String companyLongtitude; //경도44번째줄<input type="hidden" name="companyLongtitude" id="shopLongitude">
	
	private String jibunAddr;//지번주소placeholder="지번주소" name="jibunAddr">
	private String detailAddr;//상세주소detailAddr
	private String extraAddr;//참고주소 58번째줄 id="sample4_extraAddress" placeholder="참고항목" name="extraAddr">
	private String companyAddr;//업체주소  받는값없음
	private String companyPhone;//업체전화번호//68번째줄 <input type="text" name="companyPhone" value=" ">
	
	
	private int code;//업체분류//106번째줄 code<select name="code" id="choice">
	private String companyContent;//<input type="text" name="companyContent">

	private String fileNames; //파일명input type="file" name="fileNames"  id="imgInp"
	private String filePath; //파일경로설정
	private String hashTag;//태그명 ><input type="text" name="hashTag" value=" ">


	private int studioPrice;  //스튜디오price<input type="number" name="studioPrice" value="0">
	private String studioCamera;//시간 <input type="text" name="studioTime" value=" "
	private String studioTime;//<input type="text" name="studioCamera" value=" ">
	

	private String studioOption;//><input type="text" name="studioOption" value=" " id="studioOption">
	private String studioOptionPrice;//<input type="number" name="studioOptionPrice" value="0" id="studioOptionprice">
	private int studioOptionType;//<select name="studioOptionType">
	
	//드레스인경우
	private int dressFittingPrice; //<input type="number" name="dressFittingPrice" 
	private String dressFittingTime; //<input type="text" name="dressFittingTime"
				   
	private int dressRentNum;//<input type="number" name="dressRentNum"
	private int dressRentPrice;//<input type="number" name="dressRentPrice"
	private int jewelryPrice;//<input type="number" name="jewelryPrice"
	private String dressContent;//<input type="text" name="dressContent" value=" ">
	
	private String dressMending; //<input type="checkbox" name="dressMending">
	private String dressParking;  //<input type="checkbox" name="dressParking">
	//메이크업
	private int makeupBasicPrice; //<input type="number" name="makeupBasicPrice" value=" ">
	//메이크업체크박스
	
	//메이크업 옵션가격
	private int makeupParentPrice; //<th><input type="number" name="makeupParentPrice" value="0"></th>
	private int makeupVisitorPrice;//<th><input type="number" name="makeupVisitorPrice" value="0"></th>
	
	
	//홀옵션
	private String hallSelectName;
	private String hallSelectPerson;
	private String hallSelectTime;
	private int hallSelectPrice;
	private String hallSelectEtc;
	private int hallPrice;
	


	//홀
	private String hallType;  //<select name="hallType
	private int hallMinPerson; // 최소홀인원<input type="number" name="hallMinPerson" value="0"
	private int hallMaxPerson; // 최대인원<input type="number" name="hallMaxPerson" value="0">
	private String hallServiceFood;//식사여부 체크<input type="checkbox" name="hallServiceFood" value=" ">
	private String hallServiceAudio;//음악 제공 여부 체크<input type="checkbox" name="hallServiceAudio"></th>
	private String hallServiceDrink;//주류제공여부<input type="checkbox" name="hallServiceDrink"></th>
	private String hallServiceParking;//주차제공 여부<input type="checkbox" name="hallServiceParking"></th>
	private int hallFoodtype;//<select name="hallFoodtype">
	private String hallFoodmenu;//<input type="text" name="hallFoodmenu" 
	private int hallFoodprice; //<input type="text" name="hallFoodprice" value=" ">
	public CompanyInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompanyInfo(String companyName, String postNum, String roadAddr, String companyLatitude,
			String companyLongtitude, String jibunAddr, String detailAddr, String extraAddr, String companyAddr,
			String companyPhone, int code, String companyContent, String fileName, String filePath, String hashTag,
			int studioPrice, String studioCamera, String studioTime, String studioOption, String studioOptionPrice,
			int studioOptionType, int dressFittingPrice, String dressFittingTime, int dressRentNum, int dressRentPrice,
			int jewelryPrice, String dressContent, String dressMending, String dressParking, int makeupBasicPrice,
			int makeupParentPrice, int makeupVisitorPrice, String hallSelectName, String hallSelectPerson,
			String hallSelectTime, int hallSelectPrice, String hallSelectEtc, int hallPrice, String hallType,
			int hallMinPerson, int hallMaxPerson, String hallServiceFood, String hallServiceAudio,
			String hallServiceDrink, String hallServiceParking, int hallFoodtype, String hallFoodmenu,
			int hallFoodprice) {
		super();
		this.companyName = companyName;
		this.postNum = postNum;
		this.roadAddr = roadAddr;
		this.companyLatitude = companyLatitude;
		this.companyLongtitude = companyLongtitude;
		this.jibunAddr = jibunAddr;
		this.detailAddr = detailAddr;
		this.extraAddr = extraAddr;
		this.companyAddr = companyAddr;
		this.companyPhone = companyPhone;
		this.code = code;
		this.companyContent = companyContent;
		this.fileNames = fileName;
		this.filePath = filePath;
		this.hashTag = hashTag;
		this.studioPrice = studioPrice;
		this.studioCamera = studioCamera;
		this.studioTime = studioTime;
		this.studioOption = studioOption;
		this.studioOptionPrice = studioOptionPrice;
		this.studioOptionType = studioOptionType;
		this.dressFittingPrice = dressFittingPrice;
		this.dressFittingTime = dressFittingTime;
		this.dressRentNum = dressRentNum;
		this.dressRentPrice = dressRentPrice;
		this.jewelryPrice = jewelryPrice;
		this.dressContent = dressContent;
		this.dressMending = dressMending;
		this.dressParking = dressParking;
		this.makeupBasicPrice = makeupBasicPrice;
		this.makeupParentPrice = makeupParentPrice;
		this.makeupVisitorPrice = makeupVisitorPrice;
		this.hallSelectName = hallSelectName;
		this.hallSelectPerson = hallSelectPerson;
		this.hallSelectTime = hallSelectTime;
		this.hallSelectPrice = hallSelectPrice;
		this.hallSelectEtc = hallSelectEtc;
		this.hallPrice = hallPrice;
		this.hallType = hallType;
		this.hallMinPerson = hallMinPerson;
		this.hallMaxPerson = hallMaxPerson;
		this.hallServiceFood = hallServiceFood;
		this.hallServiceAudio = hallServiceAudio;
		this.hallServiceDrink = hallServiceDrink;
		this.hallServiceParking = hallServiceParking;
		this.hallFoodtype = hallFoodtype;
		this.hallFoodmenu = hallFoodmenu;
		this.hallFoodprice = hallFoodprice;
	}
	@Override
	public String toString() {
		return "CompanyInfo [companyName=" + companyName + ", postNum=" + postNum + ", roadAddr=" + roadAddr
				+ ", companyLatitude=" + companyLatitude + ", companyLongtitude=" + companyLongtitude + ", jibunAddr="
				+ jibunAddr + ", detailAddr=" + detailAddr + ", extraAddr=" + extraAddr + ", companyAddr=" + companyAddr
				+ ", companyPhone=" + companyPhone + ", code=" + code + ", companyContent=" + companyContent
				+ ", fileName=" + fileNames + ", filePath=" + filePath + ", hashTag=" + hashTag + ", studioPrice="
				+ studioPrice + ", studioCamera=" + studioCamera + ", studioTime=" + studioTime + ", studioOption="
				+ studioOption + ", studioOptionPrice=" + studioOptionPrice + ", studioOptionType=" + studioOptionType
				+ ", dressFittingPrice=" + dressFittingPrice + ", dressFittingTime=" + dressFittingTime
				+ ", dressRentNum=" + dressRentNum + ", dressRentPrice=" + dressRentPrice + ", jewelryPrice="
				+ jewelryPrice + ", dressContent=" + dressContent + ", dressMending=" + dressMending + ", dressParking="
				+ dressParking + ", makeupBasicPrice=" + makeupBasicPrice + ", makeupParentPrice=" + makeupParentPrice
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
	public String getFileName() {
		return fileNames;
	}
	public void setFileName(String fileName) {
		this.fileNames = fileName;
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
