package com.sierp.web.controller.business;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.ImmutableMap;
import com.sierp.web.controller.business.request.ProjectRegisterRequest;
import com.sierp.web.controller.business.request.ProjectSearchRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.dao.ProjectDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.business.model.Project;
import com.sierp.web.domain.business.model.ProjectJoin;
import com.sierp.web.domain.business.service.ProjectRegisterService;
import com.sierp.web.domain.business.service.ProjectSearchService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
@RequestMapping(value = "/business/project")
public class BusinessProjectController {
	
	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	@Autowired ProjectDao projectDao;
	
	@Autowired ProjectRegisterService registerService;
	@Autowired ProjectSearchService searchService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, CustomerManager manager) {

		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "business/project/main";
	}
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String getMainList(Model model, CustomerManager manager, ProjectSearchRequest request) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchList", searchService.getProjectList(request, manager.getCustomerSeq()));
		return "business/project/mainList";
	}
	
	@RequestMapping(value = "/getCompanyProjectList", method = {RequestMethod.POST})
	public String getCompanyMainList(Model model, CustomerManager manager, ProjectSearchRequest request) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchList", searchService.getProjectList(request, manager.getCustomerSeq()));
		return "business/project/companyProjectList";
	}

	@RequestMapping(value = "/getCompanyProjectListAjax", method = {RequestMethod.POST})
	@ResponseBody
	public JsonResult getCompanyProjectListAjax(Model model, CustomerManager manager, ProjectSearchRequest request) {
		
		return JsonResults.grid(request, searchService.getProjectList(request, manager.getCustomerSeq()));
	}
	
	@RequestMapping(value = "/registProject", method = RequestMethod.GET)
	public String registFreelancer(Model model, CustomerManager manager, @RequestParam(value = "companySeq", required = false) Integer companySeq) {
		
		if (companySeq != null) {
			model.addAttribute("selectedCompany", companyDao.selectCompanyBySeq(companySeq));
		}
		model.addAttribute("companyList", companyDao.selectCompanyList(manager.getCustomerSeq()));
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		return "business/project/registProject";
	}
	
	
	@RequestMapping(value = "/registProjectProc", method = RequestMethod.POST)
	@ResponseBody
	  public JsonResult registProjectProc(CustomerManager manager, @RequestBody @Valid ProjectRegisterRequest request) {
		
		Project project = registerService.registerProjectProc(request, manager);
		return JsonResults.success(ImmutableMap.of("projectSeq", project.getProjectSeq()));
	}
	
	
	@RequestMapping(value = "/viewProject", method = RequestMethod.GET)
	public String viewProject(Model model, CustomerManager manager, @RequestParam(name = "projectSeq") int projectSeq) {
		
		ProjectJoin project = projectDao.selectProjectJoinBySeq(projectSeq);
		if (project.getCustomerSeq() != manager.getCustomerSeq()) {
			throw new RuntimeException("권한이 없다");
		}
 
		model.addAttribute("project", project);
		
		return "business/project/viewProject";
	}
}
