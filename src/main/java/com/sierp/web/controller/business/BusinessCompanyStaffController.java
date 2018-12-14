package com.sierp.web.controller.business;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sierp.web.controller.business.request.CompanyManagerSearchRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.business.service.CompanyRegisterService;

@Controller
@RequestMapping(value = "/business/companyStaff")
public class BusinessCompanyStaffController {

	@Autowired CustomerDao customDao;
	@Autowired CompanyDao companyDao;
	@Autowired CompanyRegisterService registerService;
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String dashboard(Model model, CustomerManager manager) {
		
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "business/companyStaff/main";
	}
	
	
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, CompanyManagerSearchRequest request) {
		
		String phoneNo = StringUtils.isNotEmpty(request.getPhoneNo()) ? request.getPhoneNo().replace("-", "") : null;
		companyDao.selectCompanyStaffListCount(manager.getCustomerSeq(), request.getCompanyName(), request.getCompanyStaffName(), 
											phoneNo, request.getRegisterManagerId(), request);
		if (request.isEnoughListQuery()) {
			model.addAttribute("companyStaffList", companyDao.selectCompanyStaffList(manager.getCustomerSeq(), request.getCompanyName(), 
											request.getCompanyStaffName(), phoneNo, request.getRegisterManagerId(), request));
		}
		
		model.addAttribute("request", request);
		return "business/companyStaff/mainList";
	}
	
	
}