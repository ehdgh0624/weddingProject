package kr.co.simulator.model.vo;

import java.util.ArrayList;

public class SimulatorList {
	
	private ArrayList<SimulatorSelect> list;

	public SimulatorList() {
		super();
	}

	public SimulatorList(ArrayList<SimulatorSelect> list) {
		super();
		this.list = list;
	}

	public ArrayList<SimulatorSelect> getList() {
		return list;
	}

	public void setList(ArrayList<SimulatorSelect> list) {
		this.list = list;
	}
	
}
