package com.sierp.web.controller.resource.request;

import java.util.List;

import javax.validation.Valid;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.WorkerExpertType;

import lombok.Data;

@Data
public class FreelancerRegisterRequest {

	private String name;
	private String email;
	private String phoneNo;
	
	private String gender;
	private Integer birthYear;
	private Integer birthMonth;
	private Integer birthDay;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	private String addrDetail;
	
	private WorkerExpertType expertType;
	private int careerStartYear;
	private Integer careerStartMonth;
	private AcademicLevel academicLevel;
	
	private int hopeWorkPosiTypeVal;
	private int hopeRecruitTypeVal;
	
	private String managerId;
	private String customMemo;
	
	@Valid private List<FreelancerRegisterRequestCareer> careers;
	private List<Integer> preferences;
	private List<Integer> licenses;
	
//	param.skillSets = skillSets;
}
