package kr.co.simulator.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.simulator.model.dao.SimulatorDao;

@Service("simulatorService")
public class SimulatorService {

	@Autowired
	@Qualifier(value="simulatorDao")
	private SimulatorDao simulatorDao;
	
}
