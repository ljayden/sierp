package com.sierp.web.domain.business.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProjectJoin extends Project {

	private String companyName;
	private String companyStaffName;
	
	private String mainCompanyName;
	private String mainCompanyStaffName;
}
