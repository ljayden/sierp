package com.sierp.web.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	/**
	 * 로그인 전
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		//로그인 되어 있으면  home-대시보드로 리다이렉트
		return "login";
	}

	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/loginProc.do", method = RequestMethod.GET)
	@ResponseBody
	public String index(@RequestParam(value = "managerId") String id, @RequestParam(value = "managerPassword") String password) {
		
		//로그인 되어 있으면  home-대시보드로 리다이렉트
		
		//md 처리
		return "OK";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public String main(@RequestBody @Valid String a) {
	
		return "test";
	}
}