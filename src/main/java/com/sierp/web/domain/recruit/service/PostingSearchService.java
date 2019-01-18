package com.sierp.web.domain.recruit.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.sierp.web.controller.recruit.request.PostingSearchRequest;
import com.sierp.web.domain.recruit.dao.PostingDao;
import com.sierp.web.domain.recruit.model.PostingSearch;
import com.sierp.web.domain.resource.constant.FreelancerGrade;

@Service
@Slf4j
public class PostingSearchService {
	
	@Autowired PostingDao postingDao;
	
	public List<PostingSearch> getPosting(PostingSearchRequest request, int customerSeq) {
		log.debug("검색 조건->({})", request);
		
 
		Date closeStartDate = null;
		if (StringUtils.isNotEmpty(request.getCloseStart())) {
			LocalDate date = LocalDate.parse(request.getCloseStart());
			closeStartDate = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());
		}
 
		Date closeEndDate = null;
		if (StringUtils.isNotEmpty(request.getCloseEnd())) {
			LocalDate date = LocalDate.parse(request.getCloseEnd());
			closeEndDate = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());
		}
		
		List<String> statusList = Lists.newArrayList();
		if (request.getStatus() != null && request.getStatus().size() != 3) {
			statusList = request.getStatus();
		}

		Integer freelancerGradeValue = null;
		if (StringUtils.isNotEmpty(request.getFreelancerGrade())) {
			FreelancerGrade needGrade = FreelancerGrade.valueOf(request.getFreelancerGrade());
			freelancerGradeValue = needGrade.getDevGradeValue();
		}
		
		String postingYn = request.getPostingYn();
		String workType = request.getWorkType();
		String recruitType = request.getRecruitType();
		String companyName = request.getCompanyName();
		String officeWorkYn = request.getOfficeWorkYn();
		String officeHomeWorkYn = request.getOfficeHomeWorkYn();
		String homeWorkYn = request.getHomeWorkYn();
		String mainManagerId = request.getMainManagerId();
 
		postingDao.selectPostingListCount(postingYn, mainManagerId, freelancerGradeValue, workType, recruitType, 
											officeWorkYn, officeHomeWorkYn, homeWorkYn, companyName, statusList, closeStartDate, closeEndDate, customerSeq, request);

		if (request.isEnoughListQuery()) {
			List<PostingSearch> resultList = postingDao.selectPostingList(postingYn, mainManagerId, freelancerGradeValue, workType, recruitType, 
											officeWorkYn, officeHomeWorkYn, homeWorkYn, companyName, statusList, closeStartDate, closeEndDate, customerSeq, request);
		
			return resultList;
		} else {
			return Lists.newArrayList();
		}
	}
}
