package com.sierp.web.controller.business.request;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class ProjectRegisterRequest {
	
	private int companySeq;
	private Integer mainCompanySeq;
	@NotEmpty private String projectName;
	
	private String startYear;
	private String startMonth;
	private String startDay;
	
	private String endYear;
	private String endMonth;
	private String endDay;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	private String addrDetail;
	
	private String managerId;
	private String customerMemo;
}