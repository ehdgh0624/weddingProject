package kr.co.simulator.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.collection.model.vo.Dress;
import kr.co.member.model.vo.MemberHall;
import kr.co.simulator.model.dao.SimulatorDao;
import kr.co.simulator.model.vo.Simulator;

@Service("simulatorService")
public class SimulatorService {

	@Autowired
	@Qualifier(value="simulatorDao")
	private SimulatorDao simulatorDao;

	//웨딩홀 검색
	public ArrayList<MemberHall> mhSearchList(Simulator simulator) {
		return (ArrayList<MemberHall>)simulatorDao.mhSearchList(simulator);
	}

	//웨딩드레스 검색
	public ArrayList<Dress> dSearchList(Simulator simulator) {
		return (ArrayList<Dress>)simulatorDao.dSearchList(simulator);
	}

	/*public ArrayList<MemberHall> mhSearchList(MemberHall mh) {
		return (ArrayList<MemberHall>)simulatorDao.mhSearchList(mh);
	}*/

	
	
}
