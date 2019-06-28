package kr.co.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.test.dao.TestDao;

@Service("testService")
public class TestService {
	@Autowired
	@Qualifier(value="testDao")
	private TestDao testDao;
	
	public int test(String editor) {
		
		int test = testDao.test(editor);
		
		return test;
	}
	
	
}
