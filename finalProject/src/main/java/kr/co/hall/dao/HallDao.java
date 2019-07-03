package kr.co.hall.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.MemberHall;



@Repository("hallDao")
public class HallDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	public List allHallList() {
		return sqlSession.selectList("hall.selectAllHall");
	}
//	public List<MemberHall> pageHallList(int start, int end) {
//		Map<String, Integer> map = new HashMap<String,Integer>();
//		map.put("start", start);
//		map.put("end", end);
//		return sqlSession.selectList("hall.pageSelectAllList",map);
//	}
//	public int totalCount(String str) {
//		List list = null;
//		if(str.equals("S")) {
//			list = sqlSession.selectList("hall.selectAllList");
//		}
//		int count = list.size();
//		return count;
//	}
	
}
