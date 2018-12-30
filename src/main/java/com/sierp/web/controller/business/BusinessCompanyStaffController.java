package com.sierp.web.controller.business;


import java.util.Date;

import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sierp.web.controller.business.request.CompanyManagerSearchRequest;
import com.sierp.web.controller.business.request.CompanyStaffModifyRequest;
import com.sierp.web.controller.business.request.CompanyStaffRegisterRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.business.service.CompanyRegisterService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

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
	
	
	@RequestMapping(value = "/registCompanyStaffProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult registCompanyStaffProc(CustomerManager manager, @RequestBody @Valid CompanyStaffRegisterRequest request,
    										@RequestParam(value = "companySeq") int companySeq) {
		
		registerService.registerCompanyStaff(companySeq, request, manager, new Date());
		return JsonResults.success();
    }
	
	@RequestMapping(value = "/modifyCompanyStaffProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult modifyCompanyStaffProc(CustomerManager manager, @RequestBody @Valid CompanyStaffModifyRequest request) {
		
		companyDao.updateCompanyStaff(request.getSeq(), request.getName(), request.getPhoneNo(), request.getCompanyPhoneNo(), 
				request.getEmail(), request.getPosition(), request.getPart(), request.getMemo());
		return JsonResults.success();
    }
	
	
	@RequestMapping(value = "/deleteCompanyStaffProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult deleteCompanyStaffProc(CustomerManager manager, @RequestParam(value = "companyStaffSeq") int companyStaffSeq) {
		
		companyDao.deleteCompanyStaff(companyStaffSeq);
		
		return JsonResults.success();
    }
	
	@RequestMapping(value = "/getCompanyManager", method = RequestMethod.POST)
	@ResponseBody
	  public JsonResult getCompanyManager(@RequestParam(value = "companyStaffSeq") int companyStaffSeq) {
		
		return JsonResults.success(companyDao.selectCompanyStaffBySeq(companyStaffSeq));
	}
	
	@RequestMapping(value = "/getCompanyManagerList", method = RequestMethod.POST)
	@ResponseBody
	  public JsonResult getCompanyManagerList(@RequestParam(value = "companySeq") int companySeq) {
		
		return JsonResults.success(companyDao.selectCompanyStaffListByCompanySeq(companySeq));
	}
}