package com.sierp.web.controller.contract;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/contract/dashboard")
public class ContractDashboardController {

	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String dashboard() {
		return "contract/dashboard/main";
	}
}