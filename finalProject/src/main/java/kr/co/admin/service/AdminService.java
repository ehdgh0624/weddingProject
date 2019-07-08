package kr.co.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.admin.dao.AdminDao;
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

	public int addGoods(Goods g) {
		return adminDao.addGoods(g);
	}

	public AdminGoods getGList(int reqPage) {
		int total = adminDao.totalGoods();
		int pageNum = 9;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ArrayList<Goods> gl = adminDao.goodsAll(start,end);
	    
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/goodsCare.do?reqPage="+(pageNo-1)+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/goodsCare.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/adminPage.do?reqPage="+pageNo+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
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

}
