package com.sierp.web.domain.recruit.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum PostingConditionType {

	REQUIRE("필수"),
	PREFER("우대");
	
	@Getter private String description;
}
