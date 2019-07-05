package kr.co.collection.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.collection.model.dao.CollectionDao;
import kr.co.collection.model.vo.AllPageData;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;
import kr.co.goods.model.vo.Goods;
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
	
	public ArrayList<StudioSelect> selectListStudioOption(int studioNo){
		return (ArrayList<StudioSelect>)collectionDao.selectListStudioOption(studioNo);
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
	
	public ArrayList<Gallery> selectListGallery(int studioNo, String galleryCode){
		return (ArrayList<Gallery>)collectionDao.selectListGallery(studioNo, galleryCode);
	}
	
	@Transactional
	public int insertOneScrap(int objectNo, String code, String memberId, String prdName, String prdFilepath) {
		return collectionDao.insertOneScrap(objectNo, code, memberId, prdName, prdFilepath);
	}
	
	@Transactional
	public int deleteOneScrap(int objectNo, String code, String memberId) {
		return collectionDao.deleteOneScrap(objectNo, code, memberId);
	}
	
}
