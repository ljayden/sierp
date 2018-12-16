package com.sierp.web.domain.project.service;

import java.util.Date;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.business.request.ProjectRegisterRequest;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.project.dao.ProjectDao;
import com.sierp.web.domain.project.model.Project;

@Service
@Slf4j
public class ProjectRegisterService {
	
	@Autowired ProjectDao projectDao;
	
	@Transactional(rollbackFor = {Exception.class})
	public Project registerProjectProc(ProjectRegisterRequest request, CustomerManager manager) {
		
		log.debug("등록 정보 = {}", request.toString());
		
		
		return registerProject(request, manager);
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	private Project registerProject(ProjectRegisterRequest request, CustomerManager manager) {
		Project project = new Project();
		project.setCustomerSeq(manager.getCustomerSeq());
		
		project.setCompanySeq(request.getCompanySeq());
		project.setCompanyStaffSeq(request.getCompanyStaffSeq());
		
		project.setMainCompanySeq(request.getMainCompanySeq());
		project.setMainCompanyStaffSeq(request.getMainCompanyStaffSeq());
		
		project.setProjectName(request.getProjectName());
		
		project.setStartYear(request.getStartYear());
		project.setStartMonth(request.getStartMonth());
		project.setStartDay(request.getStartDay());
		
		project.setEndYear(request.getEndYear());
		project.setEndMonth(request.getEndMonth());
		project.setEndDay(request.getEndDay());
	
		project.setSido(request.getSido());
		project.setSiGunGu(request.getSigungu());
		project.setDetailAddr(request.getAddrDetail());
		
		project.setProjectDesc(request.getProjectDesc());
		project.setMainManagerId(request.getMainManagerId());
		project.setCustomerMemo(request.getCustomerMemo());
	 	
		project.setRegisterYmdt(new Date());
		project.setResiterManagerId(manager.getId());
		
		projectDao.insertProject(project);
		
		return project;
	}
}
 