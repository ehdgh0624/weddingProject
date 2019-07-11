package kr.co.experience.vo;

import java.util.Date;

public class Experience {

	private int  experienceNo;			 //경험담 글 번호
	private String  experienceWriter;	 //경험담 작성자
	private String  experienceTitle; 	 //경험담 제목
	private String  experienceContent;	 //경험담 내용(editor)
	private Date  experienceDate;		 //경험담 날짜
	private String  experienceStudio;	 //스튜디오
	private String  experienceDress;	 //드레스
	private String  experienceTag;		 //태그
	private String  experienceMakeup;	 //메이크업
	private String  experienceHall;		 //웨딩홀
	private String  experienceFileName;	 //경험담 대표사진명
	private String  experienceFilePath;	 //경험담 대표사진경로
	public Experience() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Experience(int experienceNo, String experienceWriter, String experienceTitle, String experienceContent,
			Date experienceDate, String experienceStudio, String experienceDress, String experienceTag,
			String experienceMakeup, String experienceHall, String experienceFileName, String experienceFilePath) {
		super();
		this.experienceNo = experienceNo;
		this.experienceWriter = experienceWriter;
		this.experienceTitle = experienceTitle;
		this.experienceContent = experienceContent;
		this.experienceDate = experienceDate;
		this.experienceStudio = experienceStudio;
		this.experienceDress = experienceDress;
		this.experienceTag = experienceTag;
		this.experienceMakeup = experienceMakeup;
		this.experienceHall = experienceHall;
		this.experienceFileName = experienceFileName;
		this.experienceFilePath = experienceFilePath;
	}
	public int getExperienceNo() {
		return experienceNo;
	}
	public void setExperienceNo(int experienceNo) {
		this.experienceNo = experienceNo;
	}
	public String getExperienceWriter() {
		return experienceWriter;
	}
	public void setExperienceWriter(String experienceWriter) {
		this.experienceWriter = experienceWriter;
	}
	public String getExperienceTitle() {
		return experienceTitle;
	}
	public void setExperienceTitle(String experienceTitle) {
		this.experienceTitle = experienceTitle;
	}
	public String getExperienceContent() {
		return experienceContent;
	}
	public void setExperienceContent(String experienceContent) {
		this.experienceContent = experienceContent;
	}
	public Date getExperienceDate() {
		return experienceDate;
	}
	public void setExperienceDate(Date experienceDate) {
		this.experienceDate = experienceDate;
	}
	public String getExperienceStudio() {
		return experienceStudio;
	}
	public void setExperienceStudio(String experienceStudio) {
		this.experienceStudio = experienceStudio;
	}
	public String getExperienceDress() {
		return experienceDress;
	}
	public void setExperienceDress(String experienceDress) {
		this.experienceDress = experienceDress;
	}
	public String getExperienceTag() {
		return experienceTag;
	}
	public void setExperienceTag(String experienceTag) {
		this.experienceTag = experienceTag;
	}
	public String getExperienceMakeup() {
		return experienceMakeup;
	}
	public void setExperienceMakeup(String experienceMakeup) {
		this.experienceMakeup = experienceMakeup;
	}
	public String getExperienceHall() {
		return experienceHall;
	}
	public void setExperienceHall(String experienceHall) {
		this.experienceHall = experienceHall;
	}
	public String getExperienceFileName() {
		return experienceFileName;
	}
	public void setExperienceFileName(String experienceFileName) {
		this.experienceFileName = experienceFileName;
	}
	public String getExperienceFilePath() {
		return experienceFilePath;
	}
	public void setExperienceFilePath(String experienceFilePath) {
		this.experienceFilePath = experienceFilePath;
	}
	
}
