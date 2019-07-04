package kr.co.simulator.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.collection.model.vo.Dress;
import kr.co.hall.vo.MemberHall;
import kr.co.simulator.model.vo.Simulator;

@Repository("simulatorDao")
public class SimulatorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//웨딩홀 검색
	public List<MemberHall> mhSearchList(Simulator simulator) {
		return sqlSession.selectList("simulator.mhSearchList", simulator);
	}

	//웨딩드레스 검색
	public List<Dress> dSearchList(Simulator simulator) {
		return sqlSession.selectList("simulator.dSearchList", simulator);
	}

	/*public List mhSearchList(MemberHall mh) {
		return sqlSession.selectList("simulator.mhSearchList", mh);
	}*/

	
	
}
