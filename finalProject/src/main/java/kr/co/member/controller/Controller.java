package kr.co.member.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	String handlerRequest(HttpServletRequest request, HttpServletResponse response);
}
