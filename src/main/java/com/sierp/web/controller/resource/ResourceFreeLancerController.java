package com.sierp.web.controller.resource;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sierp.web.controller.resource.request.FreelancerRegisterRequest;
import com.sierp.web.domain.common.constant.SkillSetType;
import com.sierp.web.domain.common.dao.CommonDao;
import com.sierp.web.domain.common.service.LoginService;
import com.sierp.web.domain.company.dao.CustomerDao;
import com.sierp.web.domain.company.model.CustomerManager;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;


@Controller
@RequestMapping(value = "/resource/freelancer")
public class ResourceFreeLancerController {
	
	@Autowired CustomerDao customDao;
	@Autowired CommonDao commonDao;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "resource/freelancer/main";
	}
	
	@RequestMapping(value = "/registFreelancer", method = RequestMethod.GET)
	public String registFreelancer(Model model, @SessionAttribute(name = LoginService.SESSION_MANAGER_ATTR_FIELD) CustomerManager manager) {
		
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerCode()));
		model.addAttribute("advantageList", commonDao.selectAdvantageList(manager.getCustomerCode(), null, null, true));
		model.addAttribute("skillSetTypeList", SkillSetType.values());
		return "resource/freelancer/registFreelancer";
	}
	
	
	@RequestMapping(value = "/registFreelancerProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult registFreelancerProc(HttpServletRequest request, @RequestBody @Valid FreelancerRegisterRequest param) {
		
		System.out.println(param.toString());


		return JsonResults.success();
    }
	
}