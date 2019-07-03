package kr.co.simulator.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.member.model.vo.MemberHall;
import kr.co.simulator.model.dao.SimulatorDao;

@Service("simulatorService")
public class SimulatorService {

	@Autowired
	@Qualifier(value="simulatorDao")
	private SimulatorDao simulatorDao;

	public ArrayList<MemberHall> mhSearchList(MemberHall mh) {
		return (ArrayList<MemberHall>)simulatorDao.mhSearchList(mh);
	}

	
	
}
