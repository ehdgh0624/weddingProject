package kr.co.hall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import kr.co.hall.dao.HallDao;
import kr.co.hall.vo.HallPage;
import kr.co.member.model.vo.MemberHall;

@Service("hallService")
public class HallService {
	@Autowired
	@Qualifier(value="hallDao")
	private HallDao hallDao;
	public ArrayList<MemberHall> allHallList() {
		return (ArrayList<MemberHall>) hallDao.allHallList();
	}

//	public HallPage allHallList(int reqPage) {
//		//페이지 당 게시물 수
//				int numPerPage = 9;
//				//현재 등록되어있는 총 게시물 수
//				int totalCount = hallDao.totalCount("S");
//				//페이지 수
//				int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
//				//게시물 번호 범위
//				int start = totalCount - (reqPage * numPerPage - 1);
//				int end = totalCount - (reqPage-1) * numPerPage;
//				ArrayList<MemberHall> hList = (ArrayList<MemberHall>) hallDao.pageHallList(start,end);
//				String pageNavi = "";
//				int pageNaviSize = 5;
//				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
//				if(pageNo != 1) {
//					pageNavi += "<a class='pageBtn' href='hall.do?code=all&reqPage="+(pageNo-1)+"'>이전</a>";
//				}
//				int i = 1;
//				while(!(i++ > pageNaviSize || pageNo > totalPage)) {
//					if(reqPage == pageNo) {
//						pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
//					}else {
//						pageNavi += "<a class='pageBtn' href='/hall.do?code=all&reqPage="+pageNo+"'>"+pageNo+"</a>";
//					}
//					pageNo++;
//				}
//				if(pageNo <= totalPage) {
//					pageNavi += "<a class='pageBtn' href='/hall.do?code=all&reqPage="+pageNo+"'>다음</a>";
//				}
//				HallPage pd = new HallPage(hList, pageNavi, reqPage);
//				return pd;
//	}
	

}
