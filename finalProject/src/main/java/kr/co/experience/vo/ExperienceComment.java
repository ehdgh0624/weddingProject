package kr.co.experience.vo;

import java.sql.Date;

public class ExperienceComment {
	
	public int experienceCommentNo;
	public int experienceCommentLevel;
	public String experienceCommentWriter;
	public String experienceCommentContent;
	public int experienceCommentRef;
	public int experienceCommentCommentRef;
	public Date experienceCommentDate;
	public ExperienceComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExperienceComment(int experienceCommentNo, int experienceCommentLevel, String experienceCommentWriter,
			String experienceCommentContent, int experienceCommentRef, int experienceCommentCommentRef,
			Date experienceCommentDate) {
		super();
		this.experienceCommentNo = experienceCommentNo;
		this.experienceCommentLevel = experienceCommentLevel;
		this.experienceCommentWriter = experienceCommentWriter;
		this.experienceCommentContent = experienceCommentContent;
		this.experienceCommentRef = experienceCommentRef;
		this.experienceCommentCommentRef = experienceCommentCommentRef;
		this.experienceCommentDate = experienceCommentDate;
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
	
	

	
	
}
