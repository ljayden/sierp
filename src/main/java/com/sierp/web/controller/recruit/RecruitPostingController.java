package com.sierp.web.controller.recruit;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sierp.web.controller.business.request.ProjectRegisterRequest;
import com.sierp.web.controller.recruit.request.PostingSearchRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.dao.ProjectDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
@RequestMapping(value = "/recruit/posting")
public class RecruitPostingController {

	@Autowired CompanyDao companyDao;
	@Autowired ProjectDao projectDao;
	@Autowired CustomerDao customDao;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "recruit/posting/main";
	}
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String getMainList(Model model, CustomerManager manager, PostingSearchRequest request) {
		
		model.addAttribute("request", request);
		return "recruit/posting/mainList";
	}
	
	@RequestMapping(value = "/getCompanyPostingList", method = {RequestMethod.POST})
	public String getCompanyPostingList(Model model, CustomerManager manager, PostingSearchRequest request) {
		
		model.addAttribute("request", request);
		return "recruit/posting/companyPostingList";
	}
	
	@RequestMapping(value = "/getProjectPostingList", method = {RequestMethod.POST})
	public String getProjectPostingList(Model model, CustomerManager manager, PostingSearchRequest request) {
		
		model.addAttribute("request", request);
		return "recruit/posting/projectPostingList";
	}

	@RequestMapping(value = "/registPosting", method = RequestMethod.GET)
	public String registFreelancer(Model model, CustomerManager manager, 
									@RequestParam(value = "companySeq", required = false) Integer companySeq,
									@RequestParam(value = "projectSeq", required = false) Integer projectSeq) {
		
		if (companySeq != null) {
			model.addAttribute("selectedCompany", companyDao.selectCompanyBySeq(companySeq));
		}
		model.addAttribute("companyList", companyDao.selectCompanyList(manager.getCustomerSeq()));
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		return "recruit/posting/registPosting";
	}
	
	
	@RequestMapping(value = "/registPostingProc", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult registPostingProc(CustomerManager manager, @RequestBody @Valid ProjectRegisterRequest request) {
		
		 
		return JsonResults.success(1);
	}
}