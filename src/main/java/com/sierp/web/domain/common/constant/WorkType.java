package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum WorkType {
	
	SI("SI"),
	SM("SM");
	
	@Getter private String description;
}
