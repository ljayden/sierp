package com.sierp.web.controller.resource.request;

import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.WorkerExpertType;
import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class FreelancerSearchRequest extends Pager {

	private String name;
	private AcademicLevel minAcademicLevel;
	private AcademicLevel maxAcademicLevel;
	private String mainManagerId;
	
	private WorkerExpertType workerExpertType;
	private Integer workYear; //연차
	private Integer workMonth; //연차
	
	private String licenses;
	private String preferences;
	private String skillsets;
}