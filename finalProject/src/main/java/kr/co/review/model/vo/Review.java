package kr.co.review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private String code;
	private int reviewRef;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewDate;
	private int reviewScope;
	private String reviewFilename;
	private String reviewFilepath;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, String code, int reviewRef, String reviewWriter, String reviewContent, Date reviewDate,
			int reviewScope, String reviewFilename, String reviewFilepath) {
		super();
		this.reviewNo = reviewNo;
		this.code = code;
		this.reviewRef = reviewRef;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.reviewScope = reviewScope;
		this.reviewFilename = reviewFilename;
		this.reviewFilepath = reviewFilepath;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getReviewRef() {
		return reviewRef;
	}
	public void setReviewRef(int reviewRef) {
		this.reviewRef = reviewRef;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewScope() {
		return reviewScope;
	}
	public void setReviewScope(int reviewScope) {
		this.reviewScope = reviewScope;
	}
	public String getReviewFilename() {
		return reviewFilename;
	}
	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}
	public String getReviewFilepath() {
		return reviewFilepath;
	}
	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}
	
}
