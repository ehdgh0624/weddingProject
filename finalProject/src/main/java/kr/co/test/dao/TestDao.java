package kr.co.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("testDao")
public class TestDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	public int test(String editor) {
		
		return sqlSession.update("test",editor);
		
	}

}
