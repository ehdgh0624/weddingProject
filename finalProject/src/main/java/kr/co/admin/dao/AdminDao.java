package kr.co.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.admin.vo.AdminCompany;
import kr.co.admin.vo.CompanyVo;
import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.goods.model.vo.Goods;
import kr.co.hall.vo.Hall;
import kr.co.member.model.vo.Member;
import kr.co.reservation.model.vo.Reservation;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<Member> memberAll(int start , int end,int ssCode) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("ssCode", ssCode);
		List list = sqlSession.selectList("admin.selectAll",map);
		return (ArrayList<Member>)list;
	}

	public int totalMember(int ssCode) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("ssCode", ssCode);
		int result = sqlSession.selectOne("admin.totalMember",map);
		return result;
	}

	public int addGoods(Goods g) {
		int result = sqlSession.insert("admin.addGoods",g);
		return result;
	}

	 ArrayList<Goods> getGList() {
		 
		return null;
	}

	public int totalGoods(int code) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("code", code);
		return sqlSession.selectOne("admin.totalGoods",map);
	}

	public ArrayList<Goods> goodsAll(int start, int end,int code) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		List list = sqlSession.selectList("admin.goodsAll",map); 
		return (ArrayList<Goods>)list;
	}

	public int totalSearMember(String type, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("type", type);
		map.put("keyword", keyword);
		int result = sqlSession.selectOne("admin.searchMember",map);
		return result;
	}

	public ArrayList<Member> searchMember(int start, int end, String type, String keyword) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("type", type);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.searchMsemberList",map);
		return (ArrayList<Member>)list;
	}

	public int companyTotal(int typeCode) {
		int result;
		switch(typeCode) {
		case 0:	int h=sqlSession.selectOne("admin.countHall");
				int s=sqlSession.selectOne("admin.countStudio");
				int d=sqlSession.selectOne("admin.countDress");
				int m=sqlSession.selectOne("admin.countMakeup");
				result = h+s+d+m;
		return result;
		case 1:	result = sqlSession.selectOne("admin.countHall");
		return result;
		case 2: result = sqlSession.selectOne("admin.countStudio");
		return result;
		case 3: result = sqlSession.selectOne("admin.countDress");
		return result;
		case 4: result = sqlSession.selectOne("admin.countMakeup");
		return result;
		}
		return 0;
		
		
		
	}

	public AdminCompany companyList(int start, int end, int typeCode) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("typeCode", typeCode);
		AdminCompany ac = new AdminCompany();
		List alist= sqlSession.selectList("admin.listAll",map);
		ac.setaList((ArrayList<CompanyVo>)alist);
		return ac;
	}

	public int agree(int num, String code) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("num", String.valueOf(num));
		map.put("code", code);
		System.out.println(map.get("code"));
		return sqlSession.update("admin.agreeUpdate",map);
		}

	public int reject(int num, String code) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("num", String.valueOf(num));
		map.put("code", code);
		return sqlSession.update("admin.rejectUpdate",map);
	}

	public int searchCompanyTotal(String type, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("type", type);
		map.put("keyword", keyword);
		return sqlSession.selectOne("admin.searchCompanyTotal", map);
	}

	public AdminCompany searchCompanyList(int start, int end, String type, String keyword) {
		AdminCompany ac = new AdminCompany();
		Map<String,String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("type", type);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.searchCompany",map);
		ac.setaList((ArrayList<CompanyVo>)list);
		return ac;
	}

	public int countView(int typeCode) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("code", typeCode);
		return sqlSession.selectOne("admin.countView",map);
	}

	public AdminCompany viewManager(int start, int end, int typeCode) {
		AdminCompany ac = new AdminCompany();
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("code", typeCode);
		map.put("start", start);
		map.put("end", end);
		List list = sqlSession.selectList("admin.viewManager",map);
		ac.setaList((ArrayList<CompanyVo>)list);
		return ac;
	}

	public int view(int num, String code) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("num", String.valueOf(num));
		map.put("code", code);
		return sqlSession.update("admin.view", map);
	}

	public int unview(int num, String code) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("num", String.valueOf(num));
		map.put("code", code);
		return sqlSession.update("admin.unview", map);
	}

	public int searchViewTotal(String type, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("type", type);
		map.put("keyword", keyword);
		return sqlSession.selectOne("admin.searchViewTotal",map);
	}

	public AdminCompany searchViewManagerList(int start, int end, String type, String keyword) {
		AdminCompany ac =new AdminCompany();
		Map<String,String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("type", type);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.searchViewList", map);
		ac.setaList((ArrayList<CompanyVo>)list);
		return ac;
	}

	public int searchGoodsCount(String keyword) {
		
		return sqlSession.selectOne("admin.searchGoodsCount",keyword);
	}

	public ArrayList<Goods> searchGoodsList(int start, int end, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.searchGoodsList",map); 
		return (ArrayList<Goods>)list;
	}

	public int memberAgree(String id) {
		return sqlSession.update("admin.memberAgree",id);
	}

	public int totalreservation() {
		return sqlSession.selectOne("admin.reservationCount");
	}

	public ArrayList<Reservation> reservation(int start, int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = sqlSession.selectList("admin.reservationAll", map);
		return (ArrayList<Reservation>)list;
	}

	public int reservationUpdate(int no, int ds, String dn) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("no",String.valueOf(no));
		map.put("ds", String.valueOf(ds));
		map.put("dn",dn);
		
		return sqlSession.update("admin.reservationUpdate",map);
	}

	
	
}
