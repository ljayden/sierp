package com.sierp.web.controller.resource.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.RecruitType;

import lombok.Data;

@Data
public class FreelancerRegisterRequestCareer {

	private int startYear;
	private int startMonth;
	private int endYear;
	private int endMonth;
	
	@NotNull(message = "careers.recruitType is required!") private RecruitType recruitType;
	@NotEmpty(message = "careers.jobDesc is required!") private String jobDesc;
	@NotEmpty(message = "careers.companyName is required!") private String companyName;
}