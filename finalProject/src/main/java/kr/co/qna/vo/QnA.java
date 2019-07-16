package kr.co.qna.vo;

import java.sql.Date;

public class QnA {
	private int rnum;
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private Date qnaDate;
	private int qnaCheck;
	private String qnaPw;
	private int qnaCategory;
	private String qnaAnswer;
	private Date qnaAnswerDate;
	private int qnaStatus;
	public QnA() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public QnA(int rnum, int qnaNo, String qnaTitle, String qnaContent, String qnaWriter, Date qnaDate, int qnaCheck,
			String qnaPw, int qnaCategory, String qnaAnswer, Date qnaAnswerDate, int qnaStatus) {
		super();
		this.rnum = rnum;
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaDate = qnaDate;
		this.qnaCheck = qnaCheck;
		this.qnaPw = qnaPw;
		this.qnaCategory = qnaCategory;
		this.qnaAnswer = qnaAnswer;
		this.qnaAnswerDate = qnaAnswerDate;
		this.qnaStatus = qnaStatus;
	}

	public int getqnaNo() {
		return qnaNo;
	}
	public void setqnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaCheck() {
		return qnaCheck;
	}
	public void setQnaCheck(int qnaCheck) {
		this.qnaCheck = qnaCheck;
	}
	public String getQnaPw() {
		return qnaPw;
	}
	public void setQnaPw(String qnaPw) {
		this.qnaPw = qnaPw;
	}
	public int getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(int qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public Date getQnaAnswerDate() {
		return qnaAnswerDate;
	}
	public void setQnaAnswerDate(Date qnaAnswerDate) {
		this.qnaAnswerDate = qnaAnswerDate;
	}
	public int getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(int qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return  qnaNo+"  "+qnaTitle+"  "+qnaContent+"  "+qnaWriter+"  "+qnaCheck+"  "+qnaPw+"  "+qnaCategory+"  "+qnaAnswer;
	}


}
