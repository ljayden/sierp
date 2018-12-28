package com.sierp.web.domain.business.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.sierp.web.controller.business.request.ProjectSearchRequest;
import com.sierp.web.domain.business.dao.ProjectDao;
import com.sierp.web.domain.business.model.ProjectSearch;
 

@Service
public class ProjectSearchService {

	@Autowired ProjectDao projectDao;
	
	
	public List<ProjectSearch> getProjectList(ProjectSearchRequest request, int customerSeq) {
		
		if (request.getStatus() == null || request.getStatus().size() == 0 || request.getStatus().size() == 3) {
			request.setStatus(Lists.newArrayList());
		}
		
		Date now = new Date();
		
		projectDao.selectProjectListCount(customerSeq, request.getCompanySeq(), request.getCompanyName(), request.getProjectName(), request.getStatus(),
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request, now);

		if (request.isEnoughListQuery()) {
			return projectDao.selectProjectList(customerSeq, request.getCompanySeq(), request.getCompanyName(), request.getProjectName(), request.getStatus(),
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request, now);
		} else {
			return Lists.newArrayList();
		}
	}
}
