package kr.co.simulator.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.Dress;
import kr.co.hall.vo.Hall;
import kr.co.simulator.model.dao.SimulatorDao;
import kr.co.simulator.model.vo.Simulator;

@Service("simulatorService")
public class SimulatorService {

	@Autowired
	@Qualifier(value="simulatorDao")
	private SimulatorDao simulatorDao;

	//웨딩홀 검색
	public ArrayList<Hall> hSearchList(Simulator simulator) {
		return (ArrayList<Hall>)simulatorDao.hSearchList(simulator);
	}

	//웨딩드레스 검색
	public ArrayList<Dress> dSearchList(Simulator simulator, int start) {
		int length = 3;
		return (ArrayList<Dress>)simulatorDao.dSearchList(simulator, start, start+length-1);
	}

	//웨딩드레스 총 갯수
	public int dTotalCount(Simulator simulator) {
		return simulatorDao.dTotalCount(simulator);
	}

	//웨딩드레스 더보기
	/*public ArrayList<Dress> dSearchList(String weddingLoc) {
		
		return (ArrayList<Dress>)simulatorDao.dSearchList(weddingLoc);
	}*/

	

	
	
}
