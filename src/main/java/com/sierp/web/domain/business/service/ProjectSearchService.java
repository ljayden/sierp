package com.sierp.web.domain.business.service;

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

		projectDao.selectProjectListCount(customerSeq, request.getCompanyName(), request.getProjectName(), request.getStatus(),
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request);

		if (request.isEnoughListQuery()) {
			return projectDao.selectProjectList(customerSeq, request.getCompanyName(), request.getProjectName(), request.getStatus(),
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request);
		} else {
			return Lists.newArrayList();
		}
	}
}
