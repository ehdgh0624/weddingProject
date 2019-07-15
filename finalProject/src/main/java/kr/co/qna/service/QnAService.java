package kr.co.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.admin.vo.AdminMember;
import kr.co.member.model.vo.Member;
import kr.co.qna.dao.QnADao;
import kr.co.qna.vo.QnA;
import kr.co.qna.vo.QnADataPage;

@Service("qnaService")
public class QnAService {
	@Autowired
	@Qualifier(value="qnaDao")
	private QnADao qnaDao;
	
	@Transactional
	public int insertQna(QnA qna) {
		return qnaDao.insertQna(qna);
	}


	public QnADataPage qnaAll(int reqPage) {
		int total = qnaDao.totalList();
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ArrayList<QnA> list= qnaDao.qnaAllList(start,end);
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/qnaMain.do?reqPage="+(pageNo-1)+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/qnaMain.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/qnaMain.do?reqPage="+(pageNo)+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		
		QnADataPage qdp = new QnADataPage(list, pageNavi);
		
		return qdp;
	}


	public QnA selectOneQna(int qnaNo) {
		QnA qna = qnaDao.selectOneQna(qnaNo);
		return qna;
	}


	public int pwChk(int num, String pass) {
		return  qnaDao.pwChk(num,pass);
	}

	@Transactional
	public int commentUpdate(QnA qna) {
		return qnaDao.commentUpdate(qna);
	}

	@Transactional
	public int updateQna(QnA qna) {
		return qnaDao.updateQna(qna);
	}

	@Transactional
	public int deleteQna(String qnaNo) {
		return qnaDao.deleteQna(qnaNo);
	}


	public QnADataPage qnaSearch(int reqPage, String keyword) {
		int total = qnaDao.totalSearchList(keyword);
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
	    int start = (reqPage*pageNum-pageNum)+1;
	    int end  = reqPage*pageNum;
	    ArrayList<QnA> list= qnaDao.qnaSearchList(start,end,keyword);
	    String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/qnaSearch.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/qnaSearch.do?reqPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/qnaSearch.do?reqPage="+(pageNo)+"&keyword="+keyword+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		
		QnADataPage qdp = new QnADataPage(list, pageNavi);
		
		return qdp;
	}

}
