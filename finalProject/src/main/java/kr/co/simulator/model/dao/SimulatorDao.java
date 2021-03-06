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
import kr.co.simulator.model.vo.SimulatorSelect;

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

	//Simulator 생성
	public int newSimulator(Simulator simulator) {
		return sqlSession.insert("simulator.newSimulator", simulator);
	}

	//Simulator 웨딩계산기 고유번호 받아오기
	public int simulatorNo(Simulator simulator) {
		return sqlSession.selectOne("simulator.simulatorNo", simulator);
	}

	//simulatorSelect 넣기
	public int newSimulatorSelect(SimulatorSelect simulatorSelect) {
		return sqlSession.insert("simulator.newSimulatorSelect", simulatorSelect);
	}

	// 총 금액 업데이트 
	public int updatePrice(int simulatorNo, int totalPrice) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("simulatorNo", simulatorNo);
		map.put("totalPrice", totalPrice);
		return sqlSession.update("simulator.updatePrice", map);
	}
	
	// 웨딩계산기 견적 실행 날짜 
	public String simulatorDate(int simulatorNo) {
		return sqlSession.selectOne("simulator.simulatorDate", simulatorNo);
	}

	// 메일 링크 웨딩계산기 리스트 노출
	public Simulator simulatorEmail(int num) {
		return sqlSession.selectOne("simulator.simulatorEmail", num);
	}

	// 메일 링크 웨딩계산기 옵션 리스트 노출
	public List<SimulatorSelect> simulatorOptionEmail(int num) {
		return sqlSession.selectList("simulator.simulatorOptionEmail", num);
	}


	
	
}
