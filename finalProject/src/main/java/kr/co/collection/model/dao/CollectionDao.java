package kr.co.collection.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.collection.model.vo.Collection;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.collection.model.vo.StudioSelect;
import kr.co.gallery.model.vo.Gallery;
import kr.co.goods.model.vo.Goods;
import kr.co.reservation.model.vo.Reservation;
import kr.co.review.model.vo.Review;
import kr.co.scrapbook.model.vo.Scrapbook;

@Repository("collectionDao")
public class CollectionDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int totalCount(String type) {
		List list = null;
		if(type.equals("S")) {
			list = sqlSession.selectList("studio.selectAllList");
		}else if(type.equals("D")) {
			list = sqlSession.selectList("dress.selectAllList");			
		}else if(type.equals("M")) {
			list = sqlSession.selectList("makeup.selectAllList");
		}else if(type.equals("B") || type.equals("I")) {
			list = sqlSession.selectList("goods.selectAllList", type);
		}
		int count = list.size();
		return count;
	}
	
	public int totalCountKeyword(String keyword) {
		String keywordIn = "%"+keyword+"%";
		List list = sqlSession.selectList("collectionVo.selectKeywordList", keywordIn);
		int count = list.size();
		return count;
	}
	
	public int totalCountSearch(String keyword, String searchAddr, String searchCode) {
		String [] keywordArr = 
	}
	
	public List<Studio> pageStudioList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("studio.pageSelectAllList",map);
	}
	
	public List<Dress> pageDressList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("dress.pageSelectAllList",map);
	}

	public List<Makeup> pageMakeupList(int start, int end){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("makeup.pageSelectAllList",map);
	}
	
	public List<Goods> pageGoodsList(int start, int end, String type){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("goodsType", type);
		return sqlSession.selectList("goods.pageSelectAllList",map);
	}
	
	public List<Collection> pageTagSearchList(int start, int end, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectList("collectionVo.pageSelectKeywordList",map);
	}
	
	public Scrapbook selectOneScrapbook(String memberId, String code, int objectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(memberId == null) {
			memberId = "null";
		}
		map.put("memberId", memberId);
		map.put("code", code);
		map.put("objectNo", objectNo);
		return (Scrapbook)sqlSession.selectOne("scrapbook.selectOneScrapbook",map);
	}
	
	public Studio selectOneStudio(int studioNo) {
		return (Studio)sqlSession.selectOne("studio.viewSelectOne",studioNo);
	}
	
	public List<StudioSelect> selectListStudioOption(int studioNo, int studioOptionType){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("studioNo", studioNo);
		map.put("studioOptionType", studioOptionType);
		return sqlSession.selectList("studioSelect.selectListOption",map);
	}
	
	public Dress selectOneDress(int dressNo) {
		return (Dress)sqlSession.selectOne("dress.viewSelectOne",dressNo);
	}
	
	public Makeup selectOneMakeup(int makeupNo) {
		return (Makeup)sqlSession.selectOne("makeup.viewSelectOne",makeupNo);
	}
	
	public Goods selectOneGoods(int goodsNo) {
		return (Goods)sqlSession.selectOne("goods.viewSelectOne",goodsNo);
	}
	
	public List<Gallery> selectListGallery(int galleryNo, String galleryCode){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("galleryNo", galleryNo);
		map.put("galleryCode", galleryCode);
		return sqlSession.selectList("gallery.selectListGallery",map);
	}
	
	public List<Review> selectListReview(int objectNo, String code){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewRef", objectNo);
		map.put("code", code);
		return sqlSession.selectList("review.selectListReview",map);
	}
	
	public int insertOneScrap(int objectNo, String code, String memberId, String prdName, String prdFilepath) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("objectNo", objectNo);
		map.put("code", code);
		map.put("memberId", memberId);
		map.put("prdName", prdName);
		map.put("prdFilepath", prdFilepath);
		return sqlSession.insert("scrapbook.insertOneScrap",map);
	}
	
	public int deleteOneScrap(int objectNo, String code, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("objectNo", objectNo);
		map.put("code", code);
		map.put("memberId", memberId);
		return sqlSession.delete("scrapbook.deleteOneScrap",map);
	}
	
	public int insertReservationStudio(Reservation vo, String weddingDate, String option2Date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", vo.getCode());
		map.put("prdNo", vo.getPrdNo());
		map.put("prdId", vo.getPrdId());
		map.put("prdName",vo.getPrdName());
		map.put("weddingDate", weddingDate);
		map.put("weddingTime", vo.getWeddingTime());
		map.put("totalPrice", vo.getTotalPrice());
		map.put("memberId", vo.getMemberId());
		map.put("memberName", vo.getMemberName());
		map.put("memberPhone", vo.getMemberPhone());
		map.put("memberEmail", vo.getMemberEmail());
		map.put("option1", vo.getOption1());			
		map.put("option2", vo.getOption2());
		map.put("option2Date", option2Date);
		map.put("option2Time", vo.getOption2Time());
		map.put("option3", vo.getOption3());
		return sqlSession.insert("reservation.insertReservationStudio", map);
	}
	
	public int insertReservationDress(Reservation vo, String weddingDate, String option1Date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", vo.getCode());
		map.put("prdNo", vo.getPrdNo());
		map.put("prdId", vo.getPrdId());
		map.put("prdName",vo.getPrdName());
		map.put("weddingDate", weddingDate);
		map.put("weddingTime", vo.getWeddingTime());
		map.put("totalPrice", vo.getTotalPrice());
		map.put("memberId", vo.getMemberId());
		map.put("memberName", vo.getMemberName());
		map.put("memberPhone", vo.getMemberPhone());
		map.put("memberEmail", vo.getMemberEmail());
		map.put("option1", vo.getOption1());
		map.put("option1Date", option1Date);
		map.put("option1Time", vo.getOption1Time());
		map.put("option2", vo.getOption2());
		map.put("option2Amount", vo.getAmount());
		map.put("option3", vo.getOption3());
		return sqlSession.insert("reservation.insertReservationDress",map);
	}
	
	public int insertReservationMakeup(Reservation vo, String weddingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", vo.getCode());
		map.put("prdNo", vo.getPrdNo());
		map.put("prdId", vo.getPrdId());
		map.put("prdName", vo.getPrdName());
		map.put("weddingDate", weddingDate);
		map.put("weddingTime", vo.getWeddingTime());
		map.put("totalPrice", vo.getTotalPrice());
		map.put("memberId", vo.getMemberId());
		map.put("memberName", vo.getMemberName());
		map.put("memberPhone", vo.getMemberPhone());
		map.put("memberEmail", vo.getMemberEmail());
		map.put("option1", vo.getOption1());
		map.put("option2", vo.getOption2());
		map.put("option3", vo.getOption3());
		return sqlSession.insert("reservation.insertReservationMakeup",map);
	}
	
	public int insertReservationGoods(Reservation vo, String weddingDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", vo.getCode());
		map.put("prdNo", vo.getPrdNo());
		map.put("prdName", vo.getPrdName());
		map.put("weddingDate", weddingDate);
		map.put("weddingTime", vo.getWeddingTime());
		map.put("totalPrice", vo.getTotalPrice());
		map.put("memberId", vo.getMemberId());
		map.put("memberName", vo.getMemberName());
		map.put("memberPhone", vo.getMemberPhone());
		map.put("memberEmail", vo.getMemberEmail());
		map.put("payMethod",vo.getPayMethod());
		map.put("amount", vo.getAmount());
		map.put("orderMemo", vo.getOrderMemo());
		map.put("orderAddr",vo.getOrderAddr());
		map.put("receiveName",vo.getReceiveName());
		map.put("receivePhone",vo.getReceivePhone());
		map.put("bankName", vo.getBankName());
		map.put("bankNum", vo.getBankNum());
		map.put("bankHolder", vo.getBankHolder());
		map.put("bankDate", vo.getBankDate());
		map.put("impUid",vo.getImpUid());
		map.put("applyNum",vo.getApplyNum());
		map.put("paymentDate", vo.getPaymentDate());
		return sqlSession.insert("reservation.insertReservationGoods",map);
	}
	
	public int selectReservationNo(String memberId) {
		int result = sqlSession.selectOne("reservation.selectReservationNo",memberId);
		return result;
	}
}
