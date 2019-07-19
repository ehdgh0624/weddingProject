package kr.co.simulator.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.collection.model.vo.Dress;
import kr.co.collection.model.vo.Makeup;
import kr.co.collection.model.vo.Studio;
import kr.co.hall.vo.Hall;
import kr.co.simulator.model.dao.SimulatorDao;
import kr.co.simulator.model.vo.Simulator;
import kr.co.simulator.model.vo.SimulatorSelect;

@Service("simulatorService")
public class SimulatorService {

	@Autowired
	@Qualifier(value="simulatorDao")
	private SimulatorDao simulatorDao;

	//웨딩홀 총 갯수
	public int hTotalCount(Simulator simulator) {
		return simulatorDao.hTotalCount(simulator);
	}
		
	//웨딩홀 검색
	public ArrayList<Hall> hSearchList(Simulator simulator, int Start) {
		int length = 3;
		return (ArrayList<Hall>)simulatorDao.hSearchList(simulator, Start, Start+length-1);
	}
	
	//웨딩드레스 총 갯수
	public int dTotalCount(Simulator simulator) {
		return simulatorDao.dTotalCount(simulator);
	}

	//웨딩드레스 검색
	public ArrayList<Dress> dSearchList(Simulator simulator, int Start) {
		int length = 3;
		return (ArrayList<Dress>)simulatorDao.dSearchList(simulator, Start, Start+length-1);
	}

	//메이크업 총 갯수
	public int mTotalCount(Simulator simulator) {
		return simulatorDao.mTotalCount(simulator);
	}

	//메이크업 검색
	public ArrayList<Makeup> mSearchList(Simulator simulator, int Start) {
		int length = 3;
		return (ArrayList<Makeup>)simulatorDao.mSearchList(simulator, Start, Start+length-1);
	}

	//스튜디오 총 갯수
	public int stTotalCount(Simulator simulator) {
		return simulatorDao.stTotalCount(simulator);
	}

	//스튜디오 검색
	public ArrayList<Studio> stSearchList(Simulator simulator, int Start) {
		int length = 3;
		return (ArrayList<Studio>)simulatorDao.stSearchList(simulator, Start, Start+length-1);
	}

	//Simulator 생성
	@Transactional
	public int newSimulator(Simulator simulator) {
		return simulatorDao.newSimulator(simulator);
	}

	//Simulator 웨딩계산기 고유번호 받아오기
	public int simulatorNo(Simulator simulator) {
		return simulatorDao.simulatorNo(simulator);
	}
	
	//simulatorSelect 넣기
	@Transactional
	public int newSimulatorSelect(SimulatorSelect simulatorSelect) {
		return simulatorDao.newSimulatorSelect(simulatorSelect);
	}

	// 총 금액 업데이트
	@Transactional
	public int updatePrice(int simulatorNo, int totalPrice) {
		return simulatorDao.updatePrice(simulatorNo, totalPrice);
	}

	// 웨딩계산기 견적 실행 날짜 
	public String simulatorDate(int simulatorNo) {
		return simulatorDao.simulatorDate(simulatorNo);
	}

	// 메일 링크 웨딩계산기 리스트 노출
	public Simulator simulatorEmail(int num) {
		return simulatorDao.simulatorEmail(num);
	}

	// 메일 링크 웨딩계산기 옵션 리스트 노출
	public ArrayList<SimulatorSelect> simulatorOptionEmail(int num) {
		return (ArrayList<SimulatorSelect>) simulatorDao.simulatorOptionEmail(num);
	}

		

	
	
}
