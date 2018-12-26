package com.sierp.web.domain.business.model;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class ProjectSearch {

	private int projectSeq;
	private String companyName;
	private String mainCompanyName;
	
	private String projectName;
	
	private String statusName;
	private String startYmd;
	private String endYmd;
	
	private SidoType sido;
	private SiGunGuType sigungu;
}
