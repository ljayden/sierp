package com.sierp.web.controller.resource;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sierp.web.controller.resource.request.FreelancerGetGradeRequest;
import com.sierp.web.controller.resource.request.FreelancerRegisterRequest;
import com.sierp.web.controller.resource.request.FreelancerSearchRequest;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.common.constant.RecruitType;
import com.sierp.web.domain.common.constant.SkillSetType;
import com.sierp.web.domain.common.dao.CommonDao;
import com.sierp.web.domain.resource.dao.FreelancerDao;
import com.sierp.web.domain.resource.dao.WorkerDao;
import com.sierp.web.domain.resource.model.Freelancer;
import com.sierp.web.domain.resource.service.FreelancerRegisterService;
import com.sierp.web.domain.resource.service.FreelancerSearchService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;


@Controller
@RequestMapping(value = "/resource/freelancer")
public class ResourceFreeLancerController {
	
	@Autowired CustomerDao customDao;
	@Autowired CommonDao commonDao;
	@Autowired FreelancerDao freelancerDao;
	@Autowired WorkerDao workerDao;
	
	@Autowired FreelancerRegisterService freelancerRegisterService;
	@Autowired FreelancerSearchService freelancerSearchService;
	
	
	@RequestMapping(value = "/main", method = {RequestMethod.GET})
	public String main(Model model, CustomerManager manager) {
		
		model.addAttribute("advantageList", commonDao.selectAdvantageList(manager.getCustomerCode(), null, null, true));
		model.addAttribute("skillSetTypeList", SkillSetType.values());
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "resource/freelancer/main";
	}

	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String mainList(Model model, CustomerManager manager, FreelancerSearchRequest request) {
		
		model.addAttribute("searchList", freelancerSearchService.getFreelancer(request, manager.getCustomerSeq()));
		model.addAttribute("request", request);
		return "resource/freelancer/mainList";
	}
	
	
	@RequestMapping(value = "/registFreelancer", method = RequestMethod.GET)
	public String registFreelancer(Model model, CustomerManager manager) {
		

		model.addAttribute("advantageList", commonDao.selectAdvantageList(manager.getCustomerCode(), null, null, true));
		model.addAttribute("skillSetTypeList", SkillSetType.values());
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		model.addAttribute("recruitTypeList", RecruitType.values());
		return "resource/freelancer/registFreelancer";
	}
	
	
	@RequestMapping(value = "/registFreelancerProc", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult registFreelancerProc(CustomerManager manager, @RequestBody @Valid FreelancerRegisterRequest request) {
		
		
		freelancerRegisterService.registerFreelancerProc(request, manager);

		return JsonResults.success();
    }
	
	
	@RequestMapping(value = "/viewFreelancer", method = RequestMethod.GET)
    public String viewFreelancer(Model model,  CustomerManager manager, @RequestParam(name = "freelancerSeq") int freelancerSeq) {

		Freelancer freelancer = freelancerDao.selectFreelancer(freelancerSeq);
		if (freelancer.getCustomerSeq() != manager.getCustomerSeq()) {
			throw new RuntimeException("권한이 없다");
		}
		
		model.addAttribute("advantageList", commonDao.selectAdvantageList(manager.getCustomerCode(), null, null, true));
		model.addAttribute("skillSetTypeList", SkillSetType.values());

		model.addAttribute("freelancer", freelancer);
		model.addAttribute("freelancerCareers", workerDao.selectWorkerCareerList(freelancer.getWorkerSeq()));
		model.addAttribute("freelancerAdvantages", workerDao.selectWorkerAdvantageList(freelancer.getWorkerSeq()));
		
		return "resource/freelancer/viewFreelancer";
    }
	
	@RequestMapping(value = "/getFreelancerGrade", method = RequestMethod.POST)
	@ResponseBody
    public JsonResult getFreelancerGrade(@RequestBody @Valid FreelancerGetGradeRequest request) {
		return JsonResults.success("고급");
    }
}