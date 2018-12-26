package com.sierp.web.controller.business;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.ImmutableMap;
import com.sierp.web.controller.business.request.ProjectRegisterRequest;
import com.sierp.web.controller.business.request.ProjectSearchRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.business.model.Project;
import com.sierp.web.domain.business.service.ProjectRegisterService;
import com.sierp.web.domain.business.service.ProjectSearchService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
@RequestMapping(value = "/business/project")
public class BusinessProjectController {
	
	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	
	@Autowired ProjectRegisterService registerService;
	@Autowired ProjectSearchService searchService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String search(Model model, CustomerManager manager) {

		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "business/project/main";
	}
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, ProjectSearchRequest request) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchList", searchService.getProjectList(request, manager.getCustomerSeq()));
		return "business/project/mainList";
	}
	

	@RequestMapping(value = "/registProject", method = RequestMethod.GET)
	public String registFreelancer(Model model, CustomerManager manager) {
		
		model.addAttribute("companyList", companyDao.selectCompany(manager.getCustomerSeq()));
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		return "business/project/registProject";
	}
	
	
	@RequestMapping(value = "/registProjectProc", method = RequestMethod.POST)
	@ResponseBody
	  public JsonResult registProjectProc(CustomerManager manager, @RequestBody @Valid ProjectRegisterRequest request) {
		
		Project project = registerService.registerProjectProc(request, manager);
		return JsonResults.success(ImmutableMap.of("projectSeq", project.getProjectSeq()));
	}
	
}
