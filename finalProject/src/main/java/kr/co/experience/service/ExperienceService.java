package kr.co.experience.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.experience.dao.ExperienceDao;
import kr.co.experience.vo.Experience;
import kr.co.experience.vo.ExperienceComment;
import kr.co.experience.vo.ExperienceCommentData;
import kr.co.experience.vo.ExperienePageDate;
import kr.co.reservation.model.vo.Reservation;

@Service("experienceService")
public class ExperienceService {

	@Autowired
	private ExperienceDao experienceDao;
	
	
	
	public ArrayList<Experience> ExperienceAll() {
		
		return experienceDao.ExperienceAll();
	}



	public ExperienceCommentData experienceDetail(int experienceNo) {
		ExperienceCommentData e = new ExperienceCommentData();
		ArrayList<ExperienceComment> ed = experienceDao.selectCommentList(experienceNo);
		Experience ex = experienceDao.experienceDetail(experienceNo);
		
		e.setList(ed);
		e.setE(ex);
		return e;
	}


	


	@Transactional
	public int insertexperience(Experience ex) {
		// TODO Auto-generated method stub
		return experienceDao.insertexperience(ex);
	}


	public ExperienePageDate edList(int reqPage) {
		int numPerPage = 9;   //내가 지정한 , 페이지에 띄울 	게시물의 숫자  
		int totalCount = experienceDao.totalCount();  //총개시물을 나타낸다
//		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;	
		int totalpge = 0;	
		if(totalCount%numPerPage==0){ //게시물 x개 나누고 밑에 하나씩 추가하는것들
			totalpge = (totalCount)/(numPerPage);
		}else {
			totalpge = (totalCount)/(numPerPage)+1;
		}	
		int start = (reqPage-1)*numPerPage+1;   
		int end = reqPage*numPerPage; 
	
		ArrayList<Experience> list = (ArrayList<Experience>)experienceDao.selectList(start,end);				
		String pageNavi ="";
		int pageNaviSize = 5;    // <1 2 3 4 5 ?> 
		
		
		
		/*int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;*/
		
		
		/*int pageNo = (reqPage-1)+1*+1; 위에가 1 6 11 이여서 사이즈 5를 뺴고  1 ,2 , 3, 4, 5 나오게 하였따 */		
		/*int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;*/
		int pageNo = 0;
		
		if(reqPage <3) {
			pageNo = 1;
		}else if ( reqPage+2  > totalpge      ) {
			pageNo = totalpge - pageNaviSize+1;						
		}
		else {
			pageNo = reqPage-2;
			
		}
		
		
		System.out.println(pageNo);
		
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
		System.out.println(totalCount+"totalCount");
		System.out.println(numPerPage+"numPerPage");
		System.out.println(totalpge+"totalpge");
		System.out.println(pageNavi+"pageNavipageNavi");
		ExperienePageDate ExList = new ExperienePageDate(list,pageNavi);
		return ExList;
		
		
		
	
	}
	@Transactional
	public int experienceCommentInsert(ExperienceComment ec) {
		
		return experienceDao.experienceCommentInsert(ec);
	}



	@Transactional
	public int updateComment(ExperienceComment e) {
	
		return experienceDao.updateComment(e);
	}


	@Transactional
	public int exCommentRegs(ExperienceComment e) {
		// TODO Auto-generated method stub
		return experienceDao.exCommentRegs(e);
	}


	@Transactional
	public int CommentDelete(int experienceCommentNo) {
		
		return experienceDao.CommentDelete(experienceCommentNo);
	}



	public ExperienePageDate exsearchExperience(int reqPage, String type, String keyword) {
		int numPerPage = 100;   //내가 지정한 , 페이지에 띄울 	게시물의 숫자  
		int totalCount = experienceDao.totalSearExperience(type,keyword);  //총개시물을 나타낸다
//		int totalPage =(totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;	
		int totalpge = 0;	
		if(totalCount%numPerPage==0){ //게시물 x개 나누고 밑에 하나씩 추가하는것들
			totalpge = (totalCount)/(numPerPage);
		}else {
			totalpge = (totalCount)/(numPerPage)+1;
		}	
		int start = (reqPage-1)*numPerPage+1;   
		int end = reqPage*numPerPage; 
	
		ArrayList<Experience> list = (ArrayList<Experience>)experienceDao.selectListex(start,end,type,keyword);				
		String pageNavi ="";
		int pageNaviSize = 5;    // <1 2 3 4 5 ?> 
		
		
		
		/*int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;*/
		
		
		/*int pageNo = (reqPage-1)+1*+1; 위에가 1 6 11 이여서 사이즈 5를 뺴고  1 ,2 , 3, 4, 5 나오게 하였따 */		
		/*int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;*/
		int pageNo = 0;
		
		if(reqPage <3) {
			pageNo = 1;
		}else if ( reqPage+2  > totalpge      ) {
			pageNo = totalpge - pageNaviSize+1;						
		}
		else {
			pageNo = reqPage-2;
			
		}
		
		
		System.out.println(pageNo);
		
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
		System.out.println(totalCount+"totalCount");
		System.out.println(numPerPage+"numPerPage");
		System.out.println(totalpge+"totalpge");
		System.out.println(pageNavi+"pageNavipageNavi");
		ExperienePageDate ExList = new ExperienePageDate(list,pageNavi);
		return ExList;
		
	}



	public ArrayList<Experience> selectId(String memberId) {
		
		ArrayList<Experience> list =experienceDao.selectId(memberId);					
		return list;
	}


	@Transactional
	public int exDelete(int experienceNo) {
		
		return experienceDao.exDelete(experienceNo);
	}


	@Transactional
	public Experience exChg(int experienceNo) {
		
		
		return experienceDao.experienceDetail(experienceNo);
	}


	@Transactional
	public int upDateexperience(Experience ex) {
		// TODO Auto-generated method stub
		return experienceDao.upDateexperience(ex);
	}



	public Experience eFind(int experienceNo) {
		
		return experienceDao.eFind(experienceNo);
	}



	public ArrayList<Reservation> selectSearch(String memberId) {
		
		return experienceDao.selectSearch(memberId);
	}




}
