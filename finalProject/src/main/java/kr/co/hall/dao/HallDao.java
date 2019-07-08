package kr.co.hall.dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hall.vo.Hall;



@Repository("hallDao")
public class HallDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Hall> pageHallList(int start, int end) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("hall.pageSelectAllList",map);
	}
	public int totalCount() {
		int count = sqlSession.selectOne("hall.selectAllList");
		return count;
	}
	public List<Hall> searchHall(int start, int end, Hall h, int person) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("h", h);
		map.put("person", person);
		return sqlSession.selectList("hall.hallSearch",map);
	}
	public int totalCountSearch() {
		int count = sqlSession.selectOne("hall.searchList");
		return count;
	}
	
}
