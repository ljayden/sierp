package com.sierp.web.controller.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sierp.web.domain.company.dao.CompanyDao;

@Controller
@RequestMapping(value = "/project/dashboard")
public class ProjectDashboardController {

	@Autowired CompanyDao companyDao;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String dashboard() {
	
		return "project/dashboard/main";
	}
}
