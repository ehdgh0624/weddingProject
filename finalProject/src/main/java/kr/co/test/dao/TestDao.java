package kr.co.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.test.vo.Test;

@Repository
public class TestDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	public int test(String editor) {
		
		sqlSession.update("test",editor);
		return 0;
		
	}
	public ArrayList<Test> testAll() {
	
		List<Test> list = sqlSession.selectList("testAll");
		return (ArrayList<Test>)list;
	}

}
