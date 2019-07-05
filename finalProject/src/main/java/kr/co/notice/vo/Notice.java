package kr.co.notice.vo;

public class Notice {
	
	private int noticeNO;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeDate;
	private String noticeViews;
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeNO, String noticeTitle, String noticeContent, String noticeWriter, String noticeDate,
			String noticeViews) {
		super();
		this.noticeNO = noticeNO;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
		this.noticeViews = noticeViews;
	}
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(String noticeViews) {
		this.noticeViews = noticeViews;
	}	
}
