package kr.co.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.goods.model.vo.Goods;
import kr.co.member.model.vo.Member;

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

	public int totalGoods() {
		return sqlSession.selectOne("admin.totalGoods");
	}

	public ArrayList<Goods> goodsAll(int start, int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
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

	
	
}
