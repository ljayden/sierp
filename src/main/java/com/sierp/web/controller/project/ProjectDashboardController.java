package com.sierp.web.controller.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/project/dashboard")
public class ProjectDashboardController {

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String dashboard() {
		return "project/dashboard/main";
	}
}
