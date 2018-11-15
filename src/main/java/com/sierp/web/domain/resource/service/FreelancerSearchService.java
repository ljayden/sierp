package com.sierp.web.domain.resource.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sierp.web.controller.resource.request.FreelancerSearchRequest;
import com.sierp.web.domain.common.constant.SkillSetWorkmanship;
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
		
		List<Integer> advantageList = Lists.newArrayList();
		if (StringUtils.isNotEmpty(request.getLicenses())) {
			for (String seq : request.getLicenses().split(",")) {
				advantageList.add(Integer.parseInt(seq));
			}
		}
		if (StringUtils.isNotEmpty(request.getPreferences())) {
			for (String seq : request.getPreferences().split(",")) {
				advantageList.add(Integer.parseInt(seq));
			}
		}
		
		List<Map<String, Object>> skillSetList = Lists.newArrayList();
		if (StringUtils.isNotEmpty(request.getSkillsets())) {
			for (String seqAndWorkship : request.getSkillsets().split(",")) {
				Map<String, Object> mapCondi = Maps.newHashMap();
				mapCondi.put("seq", seqAndWorkship.split(":")[0]);
				SkillSetWorkmanship skillSetWorkmanship = SkillSetWorkmanship.valueOf(seqAndWorkship.split(":")[1]);
				mapCondi.put("workmanshipVal", skillSetWorkmanship.getVal());
				skillSetList.add(mapCondi);
			}
		}
		
		freelancerDao.selectFreelancerListCount(request.getName(), minAcademicLevel, maxAcademicLevel, request.getMainManagerId(), request.getWorkerExpertType(), 
					                                             workBaseYear, workBaseMonth, customerCode, advantageList, skillSetList, request);

		if (request.isEnoughListQuery()) {
			List<FreelancerSearch> resultList = freelancerDao.selectFreelancerList(request.getName(), minAcademicLevel, maxAcademicLevel, 
				       request.getMainManagerId(), request.getWorkerExpertType(), workBaseYear, workBaseMonth, customerCode, advantageList, skillSetList, request);
			
			return resultList;
		} else {
			return Lists.newArrayList();
		}
	}
}


//만으로 
// 횟