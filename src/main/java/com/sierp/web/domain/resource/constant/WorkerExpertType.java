package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum WorkerExpertType {

	DEVELOP("개발자"),
	PUBLISHER("퍼블리셔"),
	DESIGNER("디자이너"),
	PLANNER("기획자");
	
	@Getter private String description;
}
