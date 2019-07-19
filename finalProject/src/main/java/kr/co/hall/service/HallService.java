package kr.co.hall.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gallery.model.vo.Gallery;
import kr.co.hall.dao.HallDao;
import kr.co.hall.vo.Hall;
import kr.co.hall.vo.HallPage;
import kr.co.hall.vo.HallSelect;
import kr.co.reservation.model.vo.Reservation;
import kr.co.review.model.vo.Review;
import kr.co.scrapbook.model.vo.Scrapbook;

@Service("hallService")
public class HallService {
	@Autowired
	@Qualifier(value="hallDao")
	private HallDao hallDao;
	

	public HallPage allHallList(int reqPage,String memberId) {
		//페이지 당 게시물 수
				int numPerPage = 9;
				//현재 등록되어있는 총 게시물 수
				int totalCount = hallDao.totalCount();
				//페이지 수
				int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
				//게시물 번호 범위
				int start = totalCount - (reqPage * numPerPage - 1);
				int end = totalCount - (reqPage-1) * numPerPage;
				ArrayList<Hall> hList = (ArrayList<Hall>) hallDao.pageHallList(start,end);
				ArrayList<Scrapbook> scrapList = new ArrayList<Scrapbook>();
				for(int i=0;i<hList.size();i++) {
					Scrapbook sb = hallDao.selectOneScrapbook(memberId, hList.get(i).getCode(), hList.get(i).getHallNo());
					if(sb != null) {
						scrapList.add(sb);
					}
				}
				String pageNavi = "";
				int pageNaviSize = 5;
				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
				if(pageNo != 1) {
					pageNavi += "<a class='pageBtn' href='hall.do?reqPage="+(pageNo-1)+"'>이전</a>";
				}
				int i = 1;
				while(!(i++ > pageNaviSize || pageNo > totalPage)) {
					if(reqPage == pageNo) {
						pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
					}else {
						pageNavi += "<a class='pageBtn' href='/hall.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
					}
					pageNo++;
				}
				if(pageNo <= totalPage) {
					pageNavi += "<a class='pageBtn' href='/hall.do?reqPage="+pageNo+"'>다음</a>";
				}
				HallPage pd = new HallPage(hList, pageNavi, reqPage,scrapList);
				return pd;
	}


	public HallPage HallSearch(int reqPage, Hall h, int person) {
		//페이지 당 게시물 수
				int numPerPage = 9;
				//현재 등록되어있는 총 게시물 수
				int totalCount = hallDao.totalCountSearch(h,person);
				//페이지 수
				int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
				//게시물 번호 범위
				int start = (reqPage*numPerPage-numPerPage)+1;
			    int end  = reqPage*numPerPage;
				ArrayList<Hall> hList = (ArrayList<Hall>) hallDao.searchHall(start,end,h,person);
				String pageNavi = "";
				int pageNaviSize = 5;
				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
				if(pageNo != 1) {
					pageNavi += "<a class='pageBtn' href='/hallSc.do?reqPage="+(pageNo-1)+"&hallLoc="+h.getHallLoc()+"&hallType="+h.getHallType()
					+"&menuType="+h.getHallFoodtype()+"&hallPerson="+person+"&searckHall="+h.getHallName()+"'>이전</a>";
				}
				int i = 1;
				while(!(i++ > pageNaviSize || pageNo > totalPage)) {
					if(reqPage == pageNo) {
						pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
					}else {
						pageNavi += "<a class='pageBtn' href='/hallSc.do?reqPage="+pageNo+"&hallLoc="+h.getHallLoc()+"&hallType="+h.getHallType()
						+"&menuType="+h.getHallFoodtype()+"&hallPerson="+person+"&searckHall="+h.getHallName()+"'>"+pageNo+"</a>";
					}
					pageNo++;
				}
				if(pageNo <= totalPage) {
					pageNavi += "<a class='pageBtn' href='/hallSc.do?reqPage="+(pageNo)+"&hallLoc="+h.getHallLoc()+"&hallType="+h.getHallType()
					+"&menuType="+h.getHallFoodtype()+"&hallPerson="+person+"&searckHall="+h.getHallName()+"'>다음</a>";
				}
				HallPage pd = new HallPage(hList, pageNavi, reqPage,null);
				return pd;
	}


	public HallPage hallPc(int reqPage, int hCode) {
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = hallDao.totalCountPc();
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Hall> hList = (ArrayList<Hall>) hallDao.hallPc(start,end,hCode);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='pageBtn' href='hallPc.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++ > pageNaviSize || pageNo > totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='pageBtn' href='/hallPc.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='pageBtn' href='/hallPc.do?reqPage="+pageNo+"'>다음</a>";
		}
		HallPage pd = new HallPage(hList, pageNavi, reqPage,null);
		return pd;
	}


	public Hall selectOneHall(int hallNo) {
		return hallDao.selectOneHall(hallNo);
	}


	public ArrayList<Gallery> selectListGallery(int galleryNo, String galleryCode) {
		return (ArrayList<Gallery>)hallDao.selectListGallery(galleryNo,galleryCode);
	}


	public ArrayList<Review> selectListReview(int objectNo, String code){
		return (ArrayList<Review>)hallDao.selectListReview(objectNo, code);
	}


	public Scrapbook selectOneScrapbook(String memberId, int objectNo, String code) {
		return hallDao.selectOneScrapbook(memberId, code, objectNo);
	}


	public ArrayList<HallSelect> selectListHall(int hallNo) {
		return (ArrayList<HallSelect>)hallDao.selectListHall(hallNo);
	}


	public HallSelect selectOption(int result) {
		return (HallSelect)hallDao.selectOption(result);
	}

	@Transactional
	public int insertReservationHall(Reservation vo, String weddingDate) {
		return hallDao.insertReservationHall(vo,weddingDate);
	}


	public int selectReservationNo(String memberId) {
		return hallDao.selectReservationNo(memberId);
	}

	@Transactional
	public int deleteOneScrap(int objectNo, String code, String memberId) {
		return hallDao.deleteOneScrap(objectNo, code, memberId);
	}

	@Transactional
	public int insertOneScrap(int objectNo, String code, String memberId, String prdName, String prdFilepath) {
		return hallDao.insertOneScrap(objectNo, code, memberId, prdName, prdFilepath);
	}

}
