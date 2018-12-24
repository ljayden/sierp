package com.sierp.web.domain.project.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class Project {

	private int projectSeq;
	
	private int customerSeq;
	private String mainManagerId;
	
	private int companySeq;
	private int companyStaffSeq;
	
	private Integer mainCompanySeq;
	private Integer mainCompanyStaffSeq;
	
	private String projectName;
	private Integer startYear;
	private Integer startMonth;
	private Integer startDay;
	private Date startYmdt;
	
	private Integer endYear;
	private Integer endMonth;
	private Integer endDay;
	private Date endYmdt;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private String projectDesc;
	private String customerMemo;
	
	private Date registerYmdt;
	private String resiterManagerId;

	private String endYn;
}
 
  
  