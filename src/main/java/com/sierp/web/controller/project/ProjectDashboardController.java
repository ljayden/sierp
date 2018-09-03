package com.sierp.web.controller.project;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sierp.web.dao.CompanyDao;

@Controller
@RequestMapping(value = "/project/dashboard")
@Slf4j
public class ProjectDashboardController {

	@Autowired CompanyDao companyDao;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String dashboard() {
		log.debug(companyDao.selectCompany().toString());
		return "project/dashboard/main";
	}
}
