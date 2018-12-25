package com.sierp.web.domain.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.sierp.web.controller.business.request.ProjectSearchRequest;
import com.sierp.web.domain.business.model.ProjectSearch;
import com.sierp.web.domain.project.dao.ProjectDao;
 

@Service
public class ProjectSearchService {

	@Autowired ProjectDao projectDao;
	
	
	public List<ProjectSearch> getProjectList(ProjectSearchRequest request, int customerSeq) {

		projectDao.selectProjectListCount(customerSeq, request.getCompanyName(), request.getProjectName(), "",
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request);

		if (request.isEnoughListQuery()) {
			return projectDao.selectProjectList(customerSeq, request.getCompanyName(), request.getProjectName(), "",
										request.getSido(), request.getSigungu(), request.getMainManagerId(), request);
		} else {
			return Lists.newArrayList();
		}
	}
}
