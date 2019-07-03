package kr.co.simulator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.MemberHall;

@Repository("simulatorDao")
public class SimulatorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List mhSearchList(MemberHall mh) {
		return sqlSession.selectList("simulator.mhSearchList", mh);
	}

	
	
}
