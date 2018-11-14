package com.sierp.web.controller.resource.request;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.WorkerExpertType;

import lombok.Data;

@Data
public class FreelancerRegisterRequest {

	@NotEmpty private String name;
	@NotEmpty private String email;
	private String phoneNo;
	
	@NotEmpty private String gender;
	private Integer birthYear;
	private Integer birthMonth;
	private Integer birthDay;
	
	@NotNull private SidoType sido;
	@NotNull private SiGunGuType sigungu;
	private String addrDetail;
	
	@NotNull private WorkerExpertType expertType;
	@NotNull private int careerStartYear;
	@NotNull private int careerStartMonth;
	@NotNull private AcademicLevel academicLevel;
	
	private int hopeWorkPosiTypeVal;
	private int hopeRecruitTypeVal;
	
	@NotEmpty private String managerId;
	private String customerMemo;
	
	@Valid private List<FreelancerRegisterRequestCareer> careers;
	private List<Integer> preferences;
	private List<Integer> licenses;
	
	@Valid private List<FreelancerRegisterRequesSkill> skillSets;
}
