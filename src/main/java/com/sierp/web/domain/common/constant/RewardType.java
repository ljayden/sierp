package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum RewardType {
	
	YEAR("연봉"),
	MONTH("월");
	
	@Getter private String description;
}
