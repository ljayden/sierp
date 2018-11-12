package com.sierp.web.domain.resource.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.resource.request.FreelancerRegisterRequesSkill;
import com.sierp.web.controller.resource.request.FreelancerRegisterRequest;
import com.sierp.web.controller.resource.request.FreelancerRegisterRequestCareer;
import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.company.model.CustomerManager;
import com.sierp.web.domain.resource.constant.WorkerType;
import com.sierp.web.domain.resource.dao.FreelancerDao;
import com.sierp.web.domain.resource.dao.WorkerDao;
import com.sierp.web.domain.resource.model.Freelancer;
import com.sierp.web.domain.resource.model.WorkerAdvantage;
import com.sierp.web.domain.resource.model.WorkerCareer;

@Service
public class FreelancerRegisterService {
	
	@Autowired WorkerDao workerDao;
	@Autowired FreelancerDao freelancerDao;
	
	@Transactional(rollbackFor = {Exception.class})
	public void registerFreelancerProc(FreelancerRegisterRequest request, CustomerManager manager) {
		
		Freelancer freelancer = registerFreelancer(request, manager);
		
		registerWorkerCareer(freelancer.getWorkerSeq(), request.getCareers());
		
		registerWorkerAdvantage(freelancer.getWorkerSeq(), request.getPreferences(), request.getLicenses(), request.getSkillSets());
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	private Freelancer registerFreelancer(FreelancerRegisterRequest request, CustomerManager manager) {
		Freelancer freelancer = new Freelancer();
		freelancer.setWorkerType(WorkerType.FREELANCER);
		
		freelancer.setName(request.getName());
		freelancer.setEmail(request.getEmail());
		
		freelancer.setPhoneNo(request.getPhoneNo());
		freelancer.setSex(request.getGender());
		
		freelancer.setBirthYear(request.getBirthYear());
		freelancer.setBirthMonth(request.getBirthMonth());
		freelancer.setBirthDay(request.getBirthDay());

		freelancer.setSido(request.getSido());
		freelancer.setSiGunGu(request.getSigungu());
		freelancer.setDetailAddr(request.getAddrDetail());
		
		freelancer.setWorkerExpertType(request.getExpertType());
		freelancer.setCareerStartYear(request.getCareerStartYear());
		freelancer.setCareerStartMonth(request.getCareerStartMonth());
		freelancer.setAcademicLevel(request.getAcademicLevel());

		freelancer.setMainManagerId(request.getManagerId());
		freelancer.setCutomerMemo(request.getCustomMemo());
		
		freelancer.setHopeRecruitTypeVal(request.getHopeRecruitTypeVal());
		freelancer.setHopeWorkPosiTypeVal(request.getHopeWorkPosiTypeVal());
		
		freelancer.setRegisterManagerId(manager.getId());
		freelancer.setRegisterYmdt(new Date());
		
		workerDao.insertWorker(freelancer);
		freelancerDao.insertFreelancer(freelancer);
		
		return freelancer;
	}
	
	@Transactional(rollbackFor = {Exception.class})
	private void registerWorkerCareer(int workerSeq, List<FreelancerRegisterRequestCareer> careers) {
		
		for (FreelancerRegisterRequestCareer career : careers) {
			WorkerCareer workerCareer = new WorkerCareer();
			workerCareer.setWorkerSeq(workerSeq);
			workerCareer.setWorkStartYear(career.getWorkStartYear());
			workerCareer.setWorkStartMonth(career.getWorkStartMonth());
			workerCareer.setWorkEndYear(career.getWorkEndYear());
			workerCareer.setWorkEndMonth(career.getWorkEndMonth());
			workerCareer.setRecruitType(career.getRecruitType());
			workerCareer.setJobDesc(career.getJobDesc());
			workerCareer.setCompanyName(career.getCompanyName());
			
			workerDao.insertWorkerCareer(workerCareer);
		}
	}
	
	@Transactional(rollbackFor = {Exception.class})
	private void registerWorkerAdvantage(int workerSeq, List<Integer> preferences, List<Integer> licenses, 
														List<FreelancerRegisterRequesSkill> skillSets) {
		
		for (Integer advantageSeq : preferences) {
			WorkerAdvantage workerAdvantage = new WorkerAdvantage();
			workerAdvantage.setWorkerSeq(workerSeq);
			workerAdvantage.setAdvantageSeq(advantageSeq);
			workerAdvantage.setAdvantageType(AdvantageType.PREFERENCE);
			
			workerDao.insertWorkerAdvantage(workerAdvantage);
		}
		
		for (Integer advantageSeq : licenses) {
			WorkerAdvantage workerAdvantage = new WorkerAdvantage();
			workerAdvantage.setWorkerSeq(workerSeq);
			workerAdvantage.setAdvantageSeq(advantageSeq);
			workerAdvantage.setAdvantageType(AdvantageType.LICENSE);
			
			workerDao.insertWorkerAdvantage(workerAdvantage);
		}
		
		for (FreelancerRegisterRequesSkill skillSet : skillSets) {
			WorkerAdvantage workerAdvantage = new WorkerAdvantage();
			workerAdvantage.setWorkerSeq(workerSeq);
			workerAdvantage.setAdvantageSeq(skillSet.getAdvantageSeq());
			workerAdvantage.setAdvantageType(AdvantageType.SKILL);
			workerAdvantage.setWorkmanship(skillSet.getSkillSetWorkmanship());
			
			workerDao.insertWorkerAdvantage(workerAdvantage);
		}
	}
}
 