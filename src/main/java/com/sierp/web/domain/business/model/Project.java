package com.sierp.web.domain.business.model;

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
	private Integer companyStaffSeq;
	
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
	private SiGunGuType sigungu;
	private String detailAddr;
	
	private String projectDesc;
	private String managerMemo;
	
	private Date registerYmdt;
	private String registerManagerId;
	private Date modifyYmdt;
	private String modifyManagerId;
	
	private String removeYn;
	private String endYn;
}
 
  
  