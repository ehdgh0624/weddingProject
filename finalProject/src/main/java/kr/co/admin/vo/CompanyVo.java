package kr.co.admin.vo;

public class CompanyVo {
	private int comNo;
	private String id;
	private String code;
	private String name;
	private String tel;
	private String addr;
	private int status;
	private int viewstatus;
	
	public CompanyVo(int comNo, String id, String code, String name, String tel, String addr, int status,
			int viewstatus) {
		this.comNo = comNo;
		this.id = id;
		this.code = code;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.status = status;
		this.viewstatus = viewstatus;
	}
	public CompanyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViewstatus() {
		return viewstatus;
	}
	public void setViewstatus(int viewstatus) {
		this.viewstatus = viewstatus;
	}
	
}
