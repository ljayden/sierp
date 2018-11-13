package com.sierp.web.domain.resource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sierp.web.domain.resource.constant.WorkerExpertType;
import com.sierp.web.domain.resource.dao.FreelancerDao;
import com.sierp.web.domain.resource.model.FreelancerSearch;
import com.sierp.web.result.Pager;

import lombok.Data;

@Data
public class FreelancerSearchService {

	@Autowired FreelancerDao freelancerDao;
	
	
	public List<FreelancerSearch> getFreelancer(String name, Integer minAcademicLevel, Integer maxAcademicLevel, String mainManagerId, 
			WorkerExpertType workerExpertType, int workBaseYearMonth, Pager pager) {
		
		
		List<FreelancerSearch> resultList = freelancerDao.selectFreelancerList(name, minAcademicLevel, maxAcademicLevel, 
				                                                               mainManagerId, workerExpertType, workBaseYearMonth, pager);
		return resultList;
	}
}
