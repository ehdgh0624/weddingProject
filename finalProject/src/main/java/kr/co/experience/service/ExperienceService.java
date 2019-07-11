package kr.co.experience.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.experience.dao.ExperienceDao;
import kr.co.experience.vo.Experience;
import kr.co.experience.vo.ExperienePageDate;

@Service("experienceService")
public class ExperienceService {

	@Autowired
	private ExperienceDao experienceDao;
	
	
	
	public ArrayList<Experience> ExperienceAll() {
		
		return experienceDao.ExperienceAll();
	}



	public Experience experienceDetail(Experience ex) {
		
		
		return experienceDao.experienceDetail(ex);
	}



	



	public int insertexperience(Experience ex) {
		// TODO Auto-generated method stub
		return experienceDao.insertexperience(ex);
	}



	public ExperienePageDate edList(int reqPage) {
		int numPerPage = 9;   //게시물의 숫자  
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
		int pageNo =((reqPage-1)/pageNaviSize)*pageNaviSize+1;
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

}
