package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum AcademicEndType {

	END("졸업"),
	OUT("중퇴"),
	ING("재학중");
	
	@Getter private String description;
}
