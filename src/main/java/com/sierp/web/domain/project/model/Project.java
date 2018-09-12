package com.sierp.web.domain.project.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class Project {

	private int projectSeq;
	
	private String customerCode;
	private String managerId;
	
	private int companySeq;
	private int companyStaffSeq;
	
	private String projectName;
	private Date startYmdt;
	private Date endYmdt;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private String projectInfo;
	private String secretMemo;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
