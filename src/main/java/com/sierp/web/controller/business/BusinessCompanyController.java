package com.sierp.web.controller.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sierp.web.controller.business.request.CompanySearchRequest;
import com.sierp.web.domain.company.dao.CompanyDao;
import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.CustomerManager;

@Controller
@RequestMapping(value = "/business/company")
public class BusinessCompanyController {

	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String dashboard(Model model, CustomerManager manager) {
		
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		return "business/company/main";
	}
	
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, CompanySearchRequest request) {
		
		System.out.println(request.toString());
		
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
}