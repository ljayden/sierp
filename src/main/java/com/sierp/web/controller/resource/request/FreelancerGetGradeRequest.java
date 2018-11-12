package com.sierp.web.controller.resource.request;

import javax.validation.constraints.NotNull;

import com.sierp.web.domain.resource.constant.AcademicLevel;

import lombok.Data;

@Data
public class FreelancerGetGradeRequest {

	@NotNull private int careerStartYear;
	@NotNull private int careerStartMonth;
	@NotNull private AcademicLevel academicLevel;
}
