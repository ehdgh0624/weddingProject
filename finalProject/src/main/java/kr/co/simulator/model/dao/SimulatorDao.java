package kr.co.simulator.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.MemberHall;
import kr.co.simulator.model.vo.Simulator;

@Repository("simulatorDao")
public class SimulatorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//웨딩홀 검색
	public List<MemberHall> mhSearchList(Simulator simulator) {
		return sqlSession.selectList("simulator.mhSearchList", simulator);
	}

	/*public List mhSearchList(MemberHall mh) {
		return sqlSession.selectList("simulator.mhSearchList", mh);
	}*/

	
	
}
