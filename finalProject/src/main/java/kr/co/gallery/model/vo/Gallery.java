package kr.co.gallery.model.vo;

public class Gallery {
	private int galleryNo;
	private String galleryCode;
	private String filename;
	private String filepath;
	public Gallery() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Gallery(int galleryNo, String galleryCode, String filename, String filepath) {
		super();
		this.galleryNo = galleryNo;
		this.galleryCode = galleryCode;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getGalleryNo() {
		return galleryNo;
	}
	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	public String getGalleryCode() {
		return galleryCode;
	}
	public void setGalleryCode(String galleryCode) {
		this.galleryCode = galleryCode;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
