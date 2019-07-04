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
	
	public ArrayList<Member> memberAll(int start , int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List list = sqlSession.selectList("admin.selectAll",map);
		return (ArrayList<Member>)list;
	}

	public int totalMember() {
		int result = sqlSession.selectOne("admin.totalMember");
		return result;
	}

	public int addGoods(Goods g) {
		int result = sqlSession.insert("admin.addGoods",g);
		return result;
	}

	
	
}
