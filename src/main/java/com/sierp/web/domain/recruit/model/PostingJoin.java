package com.sierp.web.domain.recruit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false) 
public class PostingJoin extends Posting {
	
	private String companyName;
	private String companyStaffName;
	private String projectName;
	
	public int getContractYearUnit() {
		if (getRecruitContractUnitValue() == null || getRecruitContractUnitValue() == 0) {
			return 0;
		}
		return getRecruitContractUnitValue() / 12;
	}
	
	public int getContractMonthUnit() {
		if (getRecruitContractUnitValue() == null || getRecruitContractUnitValue() == 0) {
			return 0;
		}
		return getRecruitContractUnitValue() % 12;
	}
}

