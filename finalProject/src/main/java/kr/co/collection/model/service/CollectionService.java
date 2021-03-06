package kr.co.collection.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.collection.model.dao.CollectionDao;
import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.Collection;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.SearchPageData;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;
import kr.co.goods.model.vo.Goods;
import kr.co.reservation.model.vo.Reservation;
import kr.co.review.model.vo.Review;
import kr.co.scrapbook.model.vo.Scrapbook;

@Service("collectionService")
public class CollectionService {
	@Autowired
	@Qualifier(value="collectionDao")
	private CollectionDao collectionDao;
	
	public AllPageData pageAllList(int reqPage){
		//페이지 당 게시물 수
		int numPerPage = 3;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("S");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Studio> sList = (ArrayList<Studio>) collectionDao.pageStudioList(start,end);
		ArrayList<Dress> dList = (ArrayList<Dress>) collectionDao.pageDressList(start,end);
		ArrayList<Makeup> mList = (ArrayList<Makeup>) collectionDao.pageMakeupList(start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=all&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=all&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=all&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(sList, dList, mList, null, null, pageNavi, reqPage);
		return pd;
	}	
	
	public SearchPageData pageSearchList(int reqPage, String keyword, String searchAddr, String searchCode, String memberId) {
		//페이지 당 게시물 수
		int numPerPage = 9;
		//검색 조건에 따른 총 게시물 수
		int totalCount = collectionDao.totalCountSearch(keyword, searchAddr, searchCode);
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Collection> cList = (ArrayList<Collection>) collectionDao.pageSearchList(start, end, keyword, searchAddr, searchCode);
		ArrayList<Scrapbook> scrapList = null;
		if(memberId != null) {
			scrapList = new ArrayList<Scrapbook>();
			for(int i=0;i<cList.size();i++) {
				Scrapbook sb = collectionDao.selectOneScrapbook(memberId, cList.get(i).getCode(), cList.get(i).getObjectNo());
				if(sb != null) {
					scrapList.add(sb);
				}else {
					scrapList.add(null);
				}
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionSearch.do?searchAddr="+searchAddr+"&searchCode="+searchCode+"&keyword="+keyword+"&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionSearch.do?searchAddr="+searchAddr+"&searchCode="+searchCode+"&keyword="+keyword+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionSearch.do?searchAddr="+searchAddr+"&searchCode="+searchCode+"&keyword="+keyword+"&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		SearchPageData pd = new SearchPageData(cList, scrapList, pageNavi, reqPage);
		return pd;
	}
	
	public SearchPageData pageTagSearchList(int reqPage, String keyword, String memberId) {
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 해당 keyword 게시물 수
		int totalCount = collectionDao.totalCountKeyword(keyword);
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Collection> cList = (ArrayList<Collection>) collectionDao.pageTagSearchList(start, end, keyword);
		ArrayList<Scrapbook> scrapList = null;
		if(memberId != null) {
			scrapList = new ArrayList<Scrapbook>();
			for(int i=0;i<cList.size();i++) {
				Scrapbook sb = collectionDao.selectOneScrapbook(memberId, cList.get(i).getCode(), cList.get(i).getObjectNo());
				if(sb != null) {
					scrapList.add(sb);
				}else {
					scrapList.add(null);
				}
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionListTagSearch.do?keyword="+keyword+"&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionListTagSearch.do?keyword="+keyword+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionListTagSearch.do?keyword="+keyword+"&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		SearchPageData pd = new SearchPageData(cList, scrapList, pageNavi, reqPage);
		return pd;		
	}
	
	public AllPageData pageStudioList(int reqPage, String memberId){
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("S");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Studio> sList = (ArrayList<Studio>) collectionDao.pageStudioList(start,end);
		ArrayList<Scrapbook> scrapList = null;
		if(memberId != null) {
			scrapList = new ArrayList<Scrapbook>();
			for(int i=0;i<sList.size();i++) {
				Scrapbook sb = collectionDao.selectOneScrapbook(memberId, sList.get(i).getCode(), sList.get(i).getStudioNo());
				if(sb != null) {
					scrapList.add(sb);
				}else {
					scrapList.add(null);
				}
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=S&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=S&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=S&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(sList, null, null, null, scrapList, pageNavi, reqPage);
		return pd;
	}

	public AllPageData pageDressList(int reqPage, String memberId){
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("D");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Dress> dList = (ArrayList<Dress>) collectionDao.pageDressList(start,end);
		ArrayList<Scrapbook> scrapList = new ArrayList<Scrapbook>();
		for(int i=0;i<dList.size();i++) {
			Scrapbook sb = collectionDao.selectOneScrapbook(memberId, dList.get(i).getCode(), dList.get(i).getDressNo());
			if(sb != null) {
				scrapList.add(sb);
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=D&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=D&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=D&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(null, dList, null, null, scrapList, pageNavi, reqPage);
		return pd;
	}
	
	public AllPageData pageMakeupList(int reqPage, String memberId){
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("M");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Makeup> mList = (ArrayList<Makeup>) collectionDao.pageMakeupList(start,end);
		ArrayList<Scrapbook> scrapList = new ArrayList<Scrapbook>();
		for(int i=0;i<mList.size();i++) {
			Scrapbook sb = collectionDao.selectOneScrapbook(memberId, mList.get(i).getCode(), mList.get(i).getMakeupNo());
			if(sb != null) {
				scrapList.add(sb);
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=M&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=M&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=M&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(null, null, mList, null, scrapList, pageNavi, reqPage);
		return pd;
	}
	
	public AllPageData pageBouquetList(int reqPage, String memberId) {
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("B");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Goods> gList = (ArrayList<Goods>) collectionDao.pageGoodsList(start,end,"B");
		ArrayList<Scrapbook> scrapList = new ArrayList<Scrapbook>();
		for(int i=0;i<gList.size();i++) {
			Scrapbook sb = collectionDao.selectOneScrapbook(memberId, gList.get(i).getCode(), gList.get(i).getGoodsNo());
			if(sb != null) {
				scrapList.add(sb);
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=B&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=B&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=B&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(null, null, null, gList, scrapList, pageNavi, reqPage);
		return pd;
	}
	
	public AllPageData pageInvitationList(int reqPage, String memberId) {
		//페이지 당 게시물 수
		int numPerPage = 9;
		//현재 등록되어있는 총 게시물 수
		int totalCount = collectionDao.totalCount("I");
		//페이지 수
		int totalPage = (totalCount%numPerPage == 0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//게시물 번호 범위
		int start = totalCount - (reqPage * numPerPage - 1);
		int end = totalCount - (reqPage-1) * numPerPage;
		ArrayList<Goods> gList = (ArrayList<Goods>) collectionDao.pageGoodsList(start,end,"I");
		ArrayList<Scrapbook> scrapList = new ArrayList<Scrapbook>();
		for(int i=0;i<gList.size();i++) {
			Scrapbook sb = collectionDao.selectOneScrapbook(memberId, gList.get(i).getCode(), gList.get(i).getGoodsNo());
			if(sb != null) {
				scrapList.add(sb);
			}
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='collectionList.do?code=I&reqPage="+(pageNo-1)+"'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='' href='/collectionList.do?code=I&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='/collectionList.do?code=I&reqPage="+pageNo+"'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		AllPageData pd = new AllPageData(null, null, null, gList, scrapList, pageNavi, reqPage);
		return pd;
	}	
	
	public Studio selectOneStudio(int studioNo) {
		return collectionDao.selectOneStudio(studioNo);
	}
	
	public ArrayList<StudioSelect> selectListStudioOption(int studioNo, int studioOptionType){
		return (ArrayList<StudioSelect>)collectionDao.selectListStudioOption(studioNo, studioOptionType);
	}

	public Dress selectOneDress(int dressNo){
		return collectionDao.selectOneDress(dressNo);
	}
	
	public Makeup selectOneMakeup(int makeupNo){
		return collectionDao.selectOneMakeup(makeupNo);
	}
	
	public Goods selectOneGoods(int goodsNo) {
		return collectionDao.selectOneGoods(goodsNo);
	}
	
	public ArrayList<Gallery> selectListGallery(int galleryNo, String galleryCode){
		return (ArrayList<Gallery>)collectionDao.selectListGallery(galleryNo, galleryCode);
	}
	
	public ArrayList<Review> selectListReview(int objectNo, String code){
		return (ArrayList<Review>)collectionDao.selectListReview(objectNo, code);
	}
	
	public Scrapbook selectOneScrapbook(String memberId, int objectNo, String code) {
		return collectionDao.selectOneScrapbook(memberId, code, objectNo);
	}
	
	@Transactional
	public int insertOneScrap(int objectNo, String code, String memberId, String prdName, String prdFilepath) {
		return collectionDao.insertOneScrap(objectNo, code, memberId, prdName, prdFilepath);
	}
	
	@Transactional
	public int deleteOneScrap(int objectNo, String code, String memberId) {
		return collectionDao.deleteOneScrap(objectNo, code, memberId);
	}
	
	@Transactional
	public int insertReservationStudio(Reservation vo, String weddingDate, String option2Date) {
		return collectionDao.insertReservationStudio(vo, weddingDate, option2Date);
	}
	
	@Transactional
	public int insertReservationDress(Reservation vo, String weddingDate, String option1Date) {
		return collectionDao.insertReservationDress(vo, weddingDate, option1Date);
	}
	
	@Transactional
	public int insertReservationMakeup(Reservation vo, String weddingDate) {
		return collectionDao.insertReservationMakeup(vo, weddingDate);
	}
	
	@Transactional
	public int insertReservationGoods(Reservation vo, String weddingDate) {
		return collectionDao.insertReservationGoods(vo, weddingDate);
	}
	
	public int selectReservationNo(String memberId) {
		return collectionDao.selectReservationNo(memberId);
	}
	
	public int selectScrapCount(int objectNo, String code) {
		return collectionDao.selectScrapCount(objectNo, code);
	}
	
	public int selectReservationCount(String memberId, int objectNo, String code) {
		return collectionDao.selectReservationCount(memberId, objectNo, code);
	}
	
	public int selectReviewCount(String memberId, int objectNo, String code) {
		return collectionDao.selectReviewCount(memberId, objectNo, code);
	}
}
