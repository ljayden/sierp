package com.sierp.web.domain.resource.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.sierp.web.controller.resource.request.FreelancerSearchRequest;
import com.sierp.web.domain.resource.dao.FreelancerDao;
import com.sierp.web.domain.resource.model.FreelancerSearch;


@Service
public class FreelancerSearchService {

	@Autowired FreelancerDao freelancerDao;
	
	
	public List<FreelancerSearch> getFreelancer(FreelancerSearchRequest request, String customerCode) {

		Integer minAcademicLevel = null;
		if (request.getMinAcademicLevel() != null) {
			minAcademicLevel = request.getMinAcademicLevel().getVal();
		}
		
		Integer maxAcademicLevel = null;
		if (request.getMaxAcademicLevel() != null) {
			maxAcademicLevel = request.getMaxAcademicLevel().getVal();
		}
		
		int workBaseYear = 0;
		int workBaseMonth = 0;
		
		if (request.getWorkYear() != null || request.getWorkMonth() != null) {
			//연차 검색이 있다면
			LocalDate conditionDate = LocalDate.now();
			if (request.getWorkYear() != null) {
				conditionDate = conditionDate.minusYears(request.getWorkYear());
			}
			
			if (request.getWorkMonth() != null) {
				conditionDate = conditionDate.minusMonths(request.getWorkMonth());
			}
			
			workBaseYear = conditionDate.getYear();
			workBaseMonth = conditionDate.getMonthValue();
		}
		
		freelancerDao.selectFreelancerListCount(request.getName(), minAcademicLevel, maxAcademicLevel, request.getMainManagerId(), request.getWorkerExpertType(), 
					                                             workBaseYear, workBaseMonth, customerCode, request);

		if (request.isEnoughListQuery()) {
			List<FreelancerSearch> resultList = freelancerDao.selectFreelancerList(request.getName(), minAcademicLevel, maxAcademicLevel, 
				       request.getMainManagerId(), request.getWorkerExpertType(), workBaseYear, workBaseMonth, customerCode, request);
			
			return resultList;
		} else {
			return Lists.newArrayList();
		}
	}
}


//만으로 
// 횟