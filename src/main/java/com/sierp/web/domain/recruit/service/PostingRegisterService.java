package com.sierp.web.domain.recruit.service;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sierp.web.controller.recruit.request.RecruitPostingRegisterRequest;
import com.sierp.web.domain.business.model.CustomerManager;

@Service
@Slf4j
public class PostingRegisterService {

	@Transactional(rollbackFor = {Exception.class})
	public void registerPosting(RecruitPostingRegisterRequest request, CustomerManager manager) {
		log.debug("request->{}", request.toString());
	}
}
