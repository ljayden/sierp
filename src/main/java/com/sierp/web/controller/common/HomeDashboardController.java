package com.sierp.web.controller.common;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/home/dashboard")
public class HomeDashboardController {


	/**
	 * 로그인 후
	 * @return
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String dashboard() {
		return "home/dashboard/main";
	}

	
}