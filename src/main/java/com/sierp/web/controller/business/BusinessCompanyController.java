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

import com.sierp.web.controller.business.request.CompanyRegisterRequest;
import com.sierp.web.controller.business.request.CompanySearchRequest;
import com.sierp.web.domain.company.dao.CompanyDao;
import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.Company;
import com.sierp.web.domain.company.model.CustomerManager;
import com.sierp.web.domain.company.service.CompanyRegisterService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
@RequestMapping(value = "/business/company")
public class BusinessCompanyController {

	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	@Autowired CompanyRegisterService registerService;
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String dashboard(Model model, CustomerManager manager) {
		
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "business/company/main";
	}
	
	
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, CompanySearchRequest request) {

		companyDao.selectCompanyListCount(manager.getCustomerSeq(), request.getCompanyName(), request.getSido(), request.getSigungu(), request.getRegisterManagerId(), request);
		if (request.isEnoughListQuery()) {
			model.addAttribute("companyList", companyDao.selectCompanyList(manager.getCustomerSeq(), request.getCompanyName(), request.getSido(), request.getSigungu(), 
																		   request.getRegisterManagerId(), request));
		}
		
		model.addAttribute("request", request);
		return "business/company/mainList";
	}
	
	
	
	@RequestMapping(value = "/registCompany", method = RequestMethod.GET)
	public String registerCompany(Model model, CustomerManager manager) {
		return "business/company/registCompany";
	}
	
	
	
	@RequestMapping(value = "/registCompanyProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult registFreelancerProc(CustomerManager manager, @RequestBody @Valid CompanyRegisterRequest request) {
		
		registerService.registerCompanyProc(request, manager);
		return JsonResults.success();
    }
	
	
	
	@RequestMapping(value = "/viewCompany", method = RequestMethod.GET)
	public String viewCompany(Model model, CustomerManager manager, @RequestParam(name = "companySeq") int companySeq) {
		
		Company company = companyDao.selectCompanyBySeq(companySeq);
		if (company.getCustomerSeq() != manager.getCustomerSeq()) {
			throw new RuntimeException("권한이 없다");
		}
 
		model.addAttribute("company", company);
		model.addAttribute("companyStaffs", companyDao.selectCompanyStaffListByCompanySeq(company.getCompanySeq()));
		
		return "business/company/viewCompany";
	}
	
	
	
}