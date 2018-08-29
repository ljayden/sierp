package com.sierp.web.controller.business;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/business/dashboard")
public class BusinessDashboardController {

	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String dashboard() {
		return "business/dashboard/main";
	}
}