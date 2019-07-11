package kr.co.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.admin.dao.AdminDao;
import kr.co.admin.vo.AdminCompany;
import kr.co.admin.vo.AdminGoods;
import kr.co.admin.vo.AdminMember;
import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

@Service("adminService")
public class AdminService {
	@Autowired
	@Qualifier(value="adminDao")
	AdminDao adminDao;
	
	public AdminMember memberAll(int reqPage,int ssCode) {
		ArrayList<Member> ma = new ArrayList<Member>();
		int total = adminDao.totalMember(ssCode);
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ma = adminDao.memberAll(start,end,ssCode);
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/adminPage.do?reqPage="+(pageNo-1)+"&sCode="+ssCode+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/adminPage.do?reqPage="+pageNo+"&sCode="+ssCode+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/adminPage.do?reqPage="+(pageNo)+"&sCode="+ssCode+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		AdminMember am = new AdminMember(ma,pageNavi);
			    
		
		return am;
	}
	@Transactional
	public int addGoods(Goods g) {
		return adminDao.addGoods(g);
	}

	public AdminGoods getGList(int reqPage,int code) {
		int total = adminDao.totalGoods(code);
		int pageNum = 9;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ArrayList<Goods> gl = adminDao.goodsAll(start,end,code);
	    
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/goodsCare.do?reqPage="+(pageNo-1)+"&code="+code+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/goodsCare.do?reqPage="+pageNo+"&code="+code+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/goodsCare.do?reqPage="+pageNo+"&code="+code+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AdminGoods ag = new AdminGoods(gl, pageNavi);
		
		return ag;
	}

	public AdminMember memberSearch(int reqPage,String type , String keyword) {
		ArrayList<Member> ma = new ArrayList<Member>();
		int total = adminDao.totalSearMember(type,keyword);
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ma = adminDao.searchMember(start,end,type,keyword);
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/searchMember.do?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/searchMember.do?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/searchMember.do?reqPage="+(pageNo)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		AdminMember am = new AdminMember(ma,pageNavi);
			    
		
		return am;	
		
		
	}



	public AdminCompany companySearch(int reqPage, int typeCode) {
		int totalCount = adminDao.companyTotal(typeCode);
		int pageNum = 10;
		int totalPage = (totalCount%pageNum == 0) ?(totalCount/pageNum) : (totalCount/pageNum+1);
		int start = (reqPage*pageNum-pageNum)+1;
		int end  = reqPage*pageNum;
		AdminCompany ac = adminDao.companyList(start,end,typeCode);
		 String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/companyManager.do?reqPage="+(pageNo-1)+"&typeCode="+typeCode+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}
			int i = 1;
			while( !(i++>pageNaviSize || pageNo>totalPage) ) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='' href='/companyManager.do?reqPage="+pageNo+"&typeCode="+typeCode+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrrow' href='/companyManager.do?reqPage="+(pageNo)+"&typeCode="+typeCode+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}
			ac.setPageNavi(pageNavi);
		return ac;
	}
	@Transactional
	public int agree(int num, String code) {
		return adminDao.agree(num,code);
	}
	@Transactional
	public int reject(int num, String code) {
		return adminDao.reject(num,code);
	}
	public AdminCompany searchCompany(int reqPage, String type, String keyword) {
		int totalCount = adminDao.searchCompanyTotal(type,keyword);
		int pageNum = 10;
		int totalPage = (totalCount%pageNum == 0) ?(totalCount/pageNum) : (totalCount/pageNum+1);
		int start = (reqPage*pageNum-pageNum)+1;
		int end  = reqPage*pageNum;
		AdminCompany ac = adminDao.searchCompanyList(start,end,type,keyword);
		 String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/searchCompany.do?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}
			int i = 1;
			while( !(i++>pageNaviSize || pageNo>totalPage) ) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='' href='/searchCompany.do?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrrow' href='/searchCompany.do?reqPage="+(pageNo)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}
			ac.setPageNavi(pageNavi);
		return ac;
	}
	public AdminCompany viewManager(int reqPage, int typeCode) {
		int totalCount = adminDao.countView(typeCode);
		int pageNum = 10;
		int totalPage = (totalCount%pageNum == 0) ?(totalCount/pageNum) : (totalCount/pageNum+1);
		int start = (reqPage*pageNum-pageNum)+1;
		int end  = reqPage*pageNum;
		AdminCompany ac = adminDao.viewManager(start,end,typeCode);
		 String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/viewstatusManager.do?reqPage="+(pageNo-1)+"&typeCode="+typeCode+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}
			int i = 1;
			while( !(i++>pageNaviSize || pageNo>totalPage) ) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='' href='/viewstatusManager.do?reqPage="+pageNo+"&typeCode="+typeCode+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrrow' href='/viewstatusManager.do?reqPage="+(pageNo)+"&typeCode="+typeCode+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}
			ac.setPageNavi(pageNavi);
		return ac;
	}
	@Transactional
	public int view(int num, String code) {
		return adminDao.view(num,code);
	}
	@Transactional
	public int unview(int num, String code) {
		return adminDao.unview(num,code);
	}
	public AdminCompany searchView(int reqPage, String type, String keyword) {
		int totalCount = adminDao.searchViewTotal(type,keyword);
		int pageNum = 10;
		int totalPage = (totalCount%pageNum == 0) ?(totalCount/pageNum) : (totalCount/pageNum+1);
		int start = (reqPage*pageNum-pageNum)+1;
		int end  = reqPage*pageNum;
		AdminCompany ac = adminDao.searchViewManagerList(start,end,type,keyword);
		 String pageNavi = "";
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
			if(pageNo != 1) {
				pageNavi += "<a class='paging-arrow prev-arrow' href='/viewManagerSearch.do?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}
			int i = 1;
			while( !(i++>pageNaviSize || pageNo>totalPage) ) {
				if(reqPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";
				}else {
					pageNavi += "<a class='' href='/viewManagerSearch.do?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(pageNo <= totalPage) {
				pageNavi += "<a class='paging-arrow next-arrrow' href='/viewManagerSearch.do?reqPage="+(pageNo)+"&type="+type+"&keyword="+keyword+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}
			ac.setPageNavi(pageNavi);
		return ac;
		
	}

}
