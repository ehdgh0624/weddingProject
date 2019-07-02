package kr.co.member.model.vo;

public class MemberAll {
	private MemberDress md;
	private MemberStudio ms;
	private MemberMakup mm;
	private MemberHall mh;
	public MemberAll() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberAll(MemberDress md, MemberStudio ms, MemberMakup mm, MemberHall mh) {
		super();
		this.md = md;
		this.ms = ms;
		this.mm = mm;
		this.mh = mh;
	}
	public MemberDress getMd() {
		return md;
	}
	public void setMd(MemberDress md) {
		this.md = md;
	}
	public MemberStudio getMs() {
		return ms;
	}
	public void setMs(MemberStudio ms) {
		this.ms = ms;
	}
	public MemberMakup getMm() {
		return mm;
	}
	public void setMm(MemberMakup mm) {
		this.mm = mm;
	}
	public MemberHall getMh() {
		return mh;
	}
	public void setMh(MemberHall mh) {
		this.mh = mh;
	}
}
