package com.sierp.web.domain.project.model;

import java.util.Date;

import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;
import com.sierp.web.domain.constants.WorkType;

import lombok.Data;

@Data
public class Project {

	private int projectSeq;
	
	private String customerCode;
	private String managerId;
	
	private String closeYn; //직무 마감
	
	private int companySeq;
	private int companyStaffSeq;
	
	private String projectName;
	private Date startYmdt;
	private Date endYmdt;
	
	private WorkType workType;	//SI, SM, BOTH
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private String projectInfo;
	private String secretMemo;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
