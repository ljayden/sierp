package com.sierp.web.controller.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sierp.web.controller.project.request.ProjectSearchRequest;
import com.sierp.web.domain.company.dao.CompanyDao;
import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.CustomerManager;

@Controller
@RequestMapping(value = "/project/search")
public class ProjectSearchController {

	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String search(Model model, CustomerManager manager) {

		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "project/search/main";
	}
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, ProjectSearchRequest request) {
		
		model.addAttribute("request", request);
		return "project/search/mainList";
	}
	
	
	@RequestMapping(value = "/registProject", method = RequestMethod.GET)
	public String registFreelancer(Model model, CustomerManager manager) {
		
		
		model.addAttribute("companyList", companyDao.selectCompany(manager.getCustomerSeq()));
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		return "project/search/registProject";
	}
}
