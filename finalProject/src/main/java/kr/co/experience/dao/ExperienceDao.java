package kr.co.experience.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.experience.vo.Experience;
@Repository("experienceDao")
public class ExperienceDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	public ArrayList<Experience> ExperienceAll() {
		
		List<Experience> list = sqlSession.selectList("experienceAll");
		
		return (ArrayList<Experience>) list;
	}
	public Experience experienceDetail(Experience ex) {
		
		return sqlSession.selectOne("experienceDetail",ex);
	}
	
	public int insertexperience(Experience ex) {
		
		return sqlSession.insert("insertexperience",ex);
	}
	public List<Experience> selectList(int start, int end) {

		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
	
		return sqlSession.selectList("experienceselectList",map);
	}
	public int totalCount() {
		List list =null;
		list = sqlSession.selectList("experienceAll");
		int count = list.size();
		return count;
	}

}
