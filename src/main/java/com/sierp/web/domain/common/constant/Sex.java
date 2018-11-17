package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum Sex {
	
	M("남자"),
	F("여자");
	
	@Getter private String description;
}
