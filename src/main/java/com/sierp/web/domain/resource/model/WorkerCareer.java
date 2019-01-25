package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.common.constant.RecruitType;

import lombok.Data;

@Data
public class WorkerCareer {

	private int workerSeq;
	
	private String workStartYm;
	private String workEndYm;

	private RecruitType recruitType;
	private String jobDesc;
	private String companyName;
	
}