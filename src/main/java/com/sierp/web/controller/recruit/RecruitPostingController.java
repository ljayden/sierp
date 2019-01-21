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

import com.sierp.web.controller.recruit.request.PostingSearchRequest;
import com.sierp.web.controller.recruit.request.RecruitPostingRegisterRequest;
import com.sierp.web.domain.business.dao.CompanyDao;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.dao.ProjectDao;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.common.constant.SkillSetType;
import com.sierp.web.domain.common.dao.CommonDao;
import com.sierp.web.domain.recruit.dao.PostingDao;
import com.sierp.web.domain.recruit.model.PostingJoin;
import com.sierp.web.domain.recruit.service.PostingRegisterService;
import com.sierp.web.domain.recruit.service.PostingSearchService;
import com.sierp.web.result.JsonResult;
import com.sierp.web.result.JsonResults;

@Controller
@RequestMapping(value = "/recruit/posting")
public class RecruitPostingController {

	@Autowired CompanyDao companyDao;
	@Autowired ProjectDao projectDao;
	@Autowired CustomerDao customDao;
	@Autowired CommonDao commonDao;
	@Autowired PostingDao postingDao;
	
	@Autowired PostingRegisterService postingRegisterService;
	@Autowired PostingSearchService postingSearchService;
	
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, CustomerManager manager) {
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "recruit/posting/main";
	}
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String getMainList(Model model, CustomerManager manager, PostingSearchRequest request) {
		
		model.addAttribute("searchList", postingSearchService.getPosting(request, manager.getCustomerSeq()));
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
		if (projectSeq != null) {
			model.addAttribute("selectedProject", projectDao.selectProjectBySeq(projectSeq));
		}
		model.addAttribute("companyList", companyDao.selectCompanyList(manager.getCustomerSeq()));
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		
		model.addAttribute("advantageList", commonDao.selectAdvantageList(manager.getCustomerCode(), null, null, true));
		model.addAttribute("skillSetTypeList", SkillSetType.values());
		
		return "recruit/posting/registPosting";
	}
	
	
	@RequestMapping(value = "/registPostingProc", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult registPostingProc(CustomerManager manager, @RequestBody @Valid RecruitPostingRegisterRequest request) {
		
		postingRegisterService.registerPostingProc(request, manager);
		 
		return JsonResults.success();
	}
	
	@RequestMapping(value = "/viewPosting", method = RequestMethod.GET)
	public String viewPosting(Model model, CustomerManager manager, @RequestParam(name = "postingSeq") int postingSeq) {
		
		PostingJoin posting = postingDao.selectPostingJoin(postingSeq);
		if (posting.getCustomerSeq() != manager.getCustomerSeq()) {
			throw new RuntimeException("권한이 없다");
		}
 
		model.addAttribute("posting", posting);
		model.addAttribute("conditions", postingDao.selectPostingConditionJoinList(postingSeq));
		
		return "recruit/posting/viewPosting";
	}
}