package com.sierp.web.controller.business.request;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class ProjectRegisterRequest {
	
	private int companySeq;
	private Integer companyStaffSeq;
	
	private Integer mainCompanySeq;
	private Integer mainCompanyStaffSeq;
	
	@NotEmpty private String projectName;
	
	private Integer startYear;
	private Integer startMonth;
	private Integer startDay;
	
	private Integer endYear;
	private Integer endMonth;
	private Integer endDay;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	private String addrDetail;
	
	private String projectDesc;
	private String mainManagerId;
	private String customerMemo;

}