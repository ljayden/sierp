package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum FreelancerGrade {

	LOW("초급", 1),
	MID("중급", 2),
	HIGH("고급", 4),
	SPEC("특급", 8);
	
	@Getter private String description;
	@Getter private int devGradeValue;
}
