package kr.co.test.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.test.dao.TestDao;
import kr.co.test.vo.Test;

@Service
public class TestService {
	@Autowired
	private TestDao testDao;
	
	public int test(String editor) {
		
		int test = testDao.test(editor);
		
		return 0;
	}

	public ArrayList<Test> testAll() {
	
		return testDao.testAll();
	}
	
	
}
