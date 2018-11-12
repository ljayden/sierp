package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.common.constant.RecruitType;

import lombok.Data;

@Data
public class WorkerCareer {

	private int workerSeq;
	
	private int workStartYear;
	private int workStartMonth;
	private Integer workEndYear;
	private Integer workEndMonth;

	private RecruitType recruitType;
	private String jobDesc;
	private String companyName;
	
}