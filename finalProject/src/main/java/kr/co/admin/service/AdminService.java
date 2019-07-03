package kr.co.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.admin.dao.AdminDao;
import kr.co.admin.vo.AdminMember;
import kr.co.member.model.vo.Member;

@Service("adminService")
public class AdminService {
	@Autowired
	@Qualifier(value="adminDao")
	AdminDao adminDao;
	
	public AdminMember memberAll(int reqPage) {
		int total = adminDao.totalMember();
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ArrayList<Member> ma = adminDao.memberAll(start,end);
	    
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/adminPage.do?reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/adminPage.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/adminPage.do?reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		AdminMember am = new AdminMember(ma,pageNavi);
			    
		
		return am;
	}

}
