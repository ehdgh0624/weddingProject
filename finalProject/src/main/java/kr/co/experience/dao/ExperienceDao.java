package kr.co.experience.dao;

import java.util.ArrayList;
import java.util.List;

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

}
