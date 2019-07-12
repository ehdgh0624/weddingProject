package kr.co.experience.vo;

import java.util.Date;

public class ExperienceComment {

	 private int experienceCommentNo;
	 private int experienceCommentLevel;
	 private String experienceCommentWriter;
	 private String experienceCommentContent;
	 private int experienceCommentRef;
	 private int experienceCommentCommentRef;
	 private Date experienceCommentDate;
	 private int experienceCommentGood;
	public ExperienceComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExperienceComment(int experienceCommentNo, int experienceCommentLevel, String experienceCommentWriter,
			String experienceCommentContent, int experienceCommentRef, int experienceCommentCommentRef,
			Date experienceCommentDate, int experienceCommentGood) {
		super();
		this.experienceCommentNo = experienceCommentNo;
		this.experienceCommentLevel = experienceCommentLevel;
		this.experienceCommentWriter = experienceCommentWriter;
		this.experienceCommentContent = experienceCommentContent;
		this.experienceCommentRef = experienceCommentRef;
		this.experienceCommentCommentRef = experienceCommentCommentRef;
		this.experienceCommentDate = experienceCommentDate;
		this.experienceCommentGood = experienceCommentGood;
	}
	public int getExperienceCommentNo() {
		return experienceCommentNo;
	}
	public void setExperienceCommentNo(int experienceCommentNo) {
		this.experienceCommentNo = experienceCommentNo;
	}
	public int getExperienceCommentLevel() {
		return experienceCommentLevel;
	}
	public void setExperienceCommentLevel(int experienceCommentLevel) {
		this.experienceCommentLevel = experienceCommentLevel;
	}
	public String getExperienceCommentWriter() {
		return experienceCommentWriter;
	}
	public void setExperienceCommentWriter(String experienceCommentWriter) {
		this.experienceCommentWriter = experienceCommentWriter;
	}
	public String getExperienceCommentContent() {
		return experienceCommentContent;
	}
	public void setExperienceCommentContent(String experienceCommentContent) {
		this.experienceCommentContent = experienceCommentContent;
	}
	public int getExperienceCommentRef() {
		return experienceCommentRef;
	}
	public void setExperienceCommentRef(int experienceCommentRef) {
		this.experienceCommentRef = experienceCommentRef;
	}
	public int getExperienceCommentCommentRef() {
		return experienceCommentCommentRef;
	}
	public void setExperienceCommentCommentRef(int experienceCommentCommentRef) {
		this.experienceCommentCommentRef = experienceCommentCommentRef;
	}
	public Date getExperienceCommentDate() {
		return experienceCommentDate;
	}
	public void setExperienceCommentDate(Date experienceCommentDate) {
		this.experienceCommentDate = experienceCommentDate;
	}
	public int getExperienceCommentGood() {
		return experienceCommentGood;
	}
	public void setExperienceCommentGood(int experienceCommentGood) {
		this.experienceCommentGood = experienceCommentGood;
	}
	
}
