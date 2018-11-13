package com.sierp.web.domain.resource.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false) 
public class FreelancerSearch extends Freelancer {
	
	private String contractStatus = "계약중";
	private String contractProjectName = "농협 차세대 개발";
	private String contractStartYmd = "2018.04";
	private String contractEndYmd = "2019.04";
}
