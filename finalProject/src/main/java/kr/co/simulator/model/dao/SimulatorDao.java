package kr.co.simulator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.collection.model.vo.Dress;
import kr.co.hall.vo.Hall;
import kr.co.simulator.model.vo.Simulator;

@Repository("simulatorDao")
public class SimulatorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//웨딩홀 검색
	public List<Hall> hSearchList(Simulator simulator) {
		return sqlSession.selectList("simulator.hSearchList", simulator);
	}

	//웨딩드레스 검색
	public List<Dress> dSearchList(Simulator simulator, int start, int end) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(simulator.getWeddingLoc());
		map.put("simulator", simulator.getWeddingLoc());
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		return sqlSession.selectList("simulator.dSearchList", map);
	}

	//웨딩드레스 총 갯수
	public int dTotalCount(Simulator simulator) {
		return sqlSession.selectOne("simulator.dTotalCount", simulator);
	}

	//웨딩드레스 더보기
	/*public List<Dress> dSearchList(String weddingLoc, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("weddingLoc", weddingLoc);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("simulator.ajaxDressList", map);
	}*/


	
	
}
