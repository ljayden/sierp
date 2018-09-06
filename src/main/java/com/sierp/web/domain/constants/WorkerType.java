package com.sierp.web.domain.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum WorkerType {

	FREELANCER("프리랜서"),
	EMPLOYEE("직원");
	
	@Getter private String description;
}
