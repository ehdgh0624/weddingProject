package kr.co.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.notice.dao.NoticeDao;
import kr.co.notice.vo.Notice;
import kr.co.notice.vo.NoticePageData;

@Service("noticeService")
public class NoticeService {
	@Autowired
	@Qualifier(value="noticeDao")
	NoticeDao noticeDao;

	public NoticePageData noticeAll(int reqPage) {
		int totalCount = noticeDao.totalCount();
		int pageNum = 10;
		int totalPage = (totalCount%pageNum == 0)?(totalCount/pageNum):(totalCount/pageNum)+1;
		int start = (reqPage*pageNum-pageNum)+1;
		int end = reqPage*pageNum;
		ArrayList<Notice> list =noticeDao.noticeMain(start,end); 
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/noticeMain.do?reqPage="+(pageNo-1)+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/noticeMain.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/noticeMain.do?reqPage="+(pageNo)+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}
	public Notice noticeView(int noticeNo) {
		Notice n = noticeDao.noticeView(noticeNo);
		if(n != null) {
			noticeDao.noticeViewUpdate(noticeNo);
		}
		return n;
	}
	@Transactional
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(n);
	}
	@Transactional
	public Notice noticeUpdateView(int noticeNo) {
	
		return noticeDao.noticeView(noticeNo);
	}
	@Transactional
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(n);
	}
	@Transactional
	public int noticeDelete(int noticeNo) {
		
		return noticeDao.noticeDelete(noticeNo);
	}
	@Transactional
	public NoticePageData noticeSearch(int reqPage, String type, String keyword) {
		int numPerPage = 100;
		int totalCount = noticeDao.noticeSearch(type,keyword); 
		int totalpge = 0;	
		if(totalCount%numPerPage==0){ 
			totalpge = (totalCount)/(numPerPage);
		}else {
			totalpge = (totalCount)/(numPerPage)+1;
		}	
		int start = (reqPage-1)*numPerPage+1;   
		int end = reqPage*numPerPage; 
		ArrayList<Notice> list = (ArrayList<Notice>)noticeDao.selectSearchList(start,end,type,keyword);
		String pageNavi ="";
		int pageNaviSize = 5;
		/*
		 * int pageNo = 0;
		 * 
		 * if(reqPage <3) { pageNo = 1; }else if ( reqPage+2 > totalpge ) { pageNo =
		 * totalpge - pageNaviSize+1; } else { pageNo = reqPage-2;
		 * 
		 * }
		 */
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo !=1) {											
			pageNavi += "<a class='btn' href='/experienceAll.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}		
		int i = 1; 
		while( !(i++>pageNaviSize || pageNo>totalpge)) {  
			if(reqPage == pageNo) { 
				 pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn' href='/experienceAll.do?reqPage="+pageNo+"'>"+pageNo+"</a>";			 
			}
		
			pageNo++;
		}
		if(pageNo <= totalpge) {
			pageNavi +="<a class='btn' href='/experienceAll.do?reqPage="+(pageNo)+"'>다음</a>";
		}
		NoticePageData npd = new NoticePageData(list,pageNavi);
		
		return npd;
	}
}
