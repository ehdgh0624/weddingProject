package kr.co.member.controller;
import java.util.Map;
public class HandlerMapping {
	private Map<String, Controller> mappings;

	public HandlerMapping() {

	}
	public Controller getController(String path) {
		return mappings.get(path);
	}
}
