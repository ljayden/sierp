package com.sierp.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/settings")
public class SettingsController {


	/**
	 * 대쉬보드 설정
	 */
	@RequestMapping(value = "/dashboardConf", method = RequestMethod.GET)
	public String dashboardConf() {
		return "settings/dashboardConf";
	}


	/**
	 * 대쉬보드 설정
	 */
	@RequestMapping(value = "/managerConf", method = RequestMethod.GET)
	public String managerConf() {
		return "settings/managerConf";
	}
}