package com.sierp.web.controller.resource.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.RecruitType;

import lombok.Data;

@Data
public class FreelancerRegisterRequestCareer {

	@NotNull private int workStartYear;
	@NotNull private int workStartMonth;
	private Integer workEndYear;
	private Integer workEndMonth;
	
	@NotNull(message = "careers.recruitType is required!") private RecruitType recruitType;
	@NotEmpty(message = "careers.jobDesc is required!") private String jobDesc;
	@NotEmpty(message = "careers.companyName is required!") private String companyName;
	
}