package kr.co.simulator.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.simulator.model.vo.Simulator;

@Repository("simulatorDao")
public class SimulatorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	//웨딩홀 총 갯수
	public int hTotalCount(Simulator simulator) {
		return sqlSession.selectOne("simulator.hTotalCount", simulator);
	}
		
	//웨딩홀 검색
	public List<Hall> hSearchList(Simulator simulator, int start, int end) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(simulator.getWeddingLoc());
		map.put("simulator", simulator.getWeddingLoc());
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		return sqlSession.selectList("simulator.hSearchList", map);
	}
	
	//웨딩드레스 총 갯수
	public int dTotalCount(Simulator simulator) {
		return sqlSession.selectOne("simulator.dTotalCount", simulator);
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

	//메이크업 총 갯수
	public int mTotalCount(Simulator simulator) {
		return sqlSession.selectOne("simulator.mTotalCount", simulator);
	}

	//메이크업 검색
	public List<Makeup> mSearchList(Simulator simulator, int start, int end) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(simulator.getWeddingLoc());
		map.put("simulator", simulator.getWeddingLoc());
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		return sqlSession.selectList("simulator.mSearchList", map);
	}
	
	//스튜디오 총 갯수
	public int stTotalCount(Simulator simulator) {
		return sqlSession.selectOne("simulator.stTotalCount", simulator);
	}

	//스튜디오 검색
	public List<Studio> stSearchList(Simulator simulator, int start, int end) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(simulator.getWeddingLoc());
		map.put("simulator", simulator.getWeddingLoc());
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		return sqlSession.selectList("simulator.stSearchList", map);
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
