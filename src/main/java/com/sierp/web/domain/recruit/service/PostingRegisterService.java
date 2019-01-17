package com.sierp.web.domain.recruit.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.recruit.request.RecruitPostingRegisterRequest;
import com.sierp.web.domain.business.model.CustomerManager;
import com.sierp.web.domain.recruit.constant.PostingConditionType;
import com.sierp.web.domain.recruit.constant.PostingStatus;
import com.sierp.web.domain.recruit.dao.PostingDao;
import com.sierp.web.domain.recruit.model.Posting;
import com.sierp.web.domain.recruit.model.PostingCondition;

@Service
@Slf4j
public class PostingRegisterService {

	@Autowired PostingDao postingDao;
	
	@Transactional(rollbackFor = {Exception.class})
	public void registerPostingProc(RecruitPostingRegisterRequest request, CustomerManager manager) {
		log.debug("request->{}", request.toString());
		
		registerPosting(request, manager);
	}
	
	
	private void registerPosting(RecruitPostingRegisterRequest request, CustomerManager manager) {
		
		Posting posting = new Posting();
		
		posting.setCustomerSeq(manager.getCustomerSeq());
		
		posting.setPosingTitle(request.getPostingTitle());
		posting.setStatus(PostingStatus.ING);
		
		if (StringUtils.isNotEmpty(request.getEndYmd())) {	//날짜 포맷은 yyyy-mm-dd
			LocalDate endDate = LocalDate.parse(request.getEndYmd());
			posting.setEndYmdt(Date.from(endDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
		}

		posting.setSitePostYn(request.getSitePostYn());
		
		posting.setCompanySeq(request.getCompanySeq());
		posting.setCompanyStaffSeq(request.getCompanyStaffSeq());
		posting.setProjectSeq(request.getProjectSeq());
		posting.setWorkType(request.getWorkType());
		posting.setRecruitType(request.getRecruitType());
		posting.setRecruitManCount(request.getRecruitManCount());
		
		posting.setNeedAcademicLevel(request.getNeedAcademicLevel());
		if (request.getNeedAcademicLevel() != null) {
			posting.setNeedAcademicLevelValue(request.getNeedAcademicLevel().getVal());
		} else {
			posting.setNeedAcademicLevelValue(0);
		}
		
		posting.setNeedFreeGrade(request.getNeedFreeGrade());
		if (request.getNeedFreeGrade() != null) {
			posting.setNeedFreeGradeValue(request.getNeedFreeGrade().getDevGradeValue());
		} else {
			posting.setNeedFreeGradeValue(0);
		}
		
		posting.setLimitWorkYearMin(request.getLimitWorkYearMin());
		posting.setLimitWorkYearMax(request.getLimitWorkYearMax());
		posting.setLimitAgeMin(request.getLimitAgeMin());
		posting.setLimitAgeMax(request.getLimitAgeMax());
		posting.setRecruitContractUnitValue(request.getRecruitContractUnitValue());
		
		posting.setRewardType(request.getRewardType());
		if (posting.getRewardType() != null) {
			posting.setRewardMinPrice(request.getRewardMinPrice());
			posting.setRewardMaxPrice(request.getRewardMaxPrice());
		}

		
		posting.setWorkSido(request.getWorkSido());
		posting.setWorkSigungu(request.getWorkSiGunGu());
		posting.setWorkDetailAddr(request.getWorkDetailAddr());
		
		posting.setOfficeWorkYn(request.getOfficeWorkYn());
		posting.setOfficeHomeWorkYn(request.getOfficeHomeWorkYn());
		posting.setHomeWorkYn(request.getHomeWorkYn());
		
		posting.setJobInfo(request.getJobInfo());
		posting.setRecruitInfo(request.getRecruitInfo());
		posting.setManagerMemo(request.getManagerMemo());
		posting.setMainManagerId(request.getMainManagerId());
		posting.setRegisterYmdt(new Date());
		posting.setRegisterManagerId(manager.getId());
		
		postingDao.insertPosting(posting);
		
		registerPostingCondition(posting, request.getNeeds(), request.getPrefers(), manager);
	}
	
	private void registerPostingCondition(Posting posting, List<PostingCondition> needs, List<PostingCondition> prefers, CustomerManager manager) {
		
		for (PostingCondition needCondition : needs) {
			needCondition.setConditionType(PostingConditionType.REQUIRE);
			needCondition.setPostingSeq(posting.getPostingSeq());
			
			if (needCondition.getWorkmanship() != null) {
				needCondition.setWorkmanshipVal(needCondition.getWorkmanship().getVal());
			}
			postingDao.insertPostingCondition(needCondition);
		}
		
		for (PostingCondition preferCondition : prefers) {
			preferCondition.setConditionType(PostingConditionType.PREFER);
			preferCondition.setPostingSeq(posting.getPostingSeq());
			
			if (preferCondition.getWorkmanship() != null) {
				preferCondition.setWorkmanshipVal(preferCondition.getWorkmanship().getVal());
			}
			postingDao.insertPostingCondition(preferCondition);
		}
	}
}
