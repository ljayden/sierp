package com.sierp.web.controller.recruit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Lists;
import com.sierp.web.controller.recruit.request.PostingSearchRequest;
import com.sierp.web.domain.business.dao.CustomerDao;
import com.sierp.web.domain.business.model.CustomerManager;

@Controller
@RequestMapping(value = "/recruit/suggestion")
public class RecruitSuggestionController {

	@Autowired CustomerDao customDao;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model, CustomerManager manager) {
		model.addAttribute("managerList", customDao.selectCustomerManagerList(manager.getCustomerSeq()));
		return "recruit/suggestion/main";
	}
	
	
	@RequestMapping(value = "/getMainList", method = {RequestMethod.POST})
	public String getMainList(Model model, CustomerManager manager, PostingSearchRequest request) {
		
		model.addAttribute("searchList", Lists.newArrayList());
		model.addAttribute("request", request);
		return "recruit/posting/mainList";
	}
}