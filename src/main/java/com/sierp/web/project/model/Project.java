package com.sierp.web.project.model;

import java.util.Date;

import com.sierp.web.constants.SiGunGuType;
import com.sierp.web.constants.SidoType;

import lombok.Data;

@Data
public class Project {

	private int projectSeq;
	
	private String customerCode;
	private String managerId;
	
	private boolean close; //프로젝트 마감

	private String companyCode;
	private String companyStaff;
	
	private String projectName;
	private Date startYmdt;
	private Date endYmdt;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private String memo;
	private String notice;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
