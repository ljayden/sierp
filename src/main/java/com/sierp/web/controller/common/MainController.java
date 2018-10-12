package com.sierp.web.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sierp.web.domain.common.service.LoginService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
public class MainController {

	@Autowired LoginService loginService;
	
	/**
	 * 로그인 전
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		//로그인 되어 있으면  home-대시보드로 리다이렉트
		return "login";
	}

	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/loginProc", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult loginProc(@RequestParam(value = "managerId") String id, 
						@RequestParam(value = "managerPassword") String password, 
						@RequestParam(value = "customerCode", defaultValue = "DEMOCOM") String customerCode, 
						HttpSession session) {
		
		return loginService.login(customerCode, id, password, session);
	}
	
	/**
	 * 로그아웃 처리
	 */
	@RequestMapping(value = "/logoutProc", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult logoutProc(HttpSession session) {
		
		session.setAttribute(LoginService.SESSION_MANAGER_ATTR_FIELD, null);
		session.setAttribute(LoginService.SESSION_CUSTOM_ATTR_FIELD, null);
		return JsonResults.success();
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public String main(@RequestBody @Valid String name) {
	
		return "test";
	}
}