package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum AdvantageType {

	PREFERENCE("우대조건"), //우대조건
	LICENSE("자격증"),	//자격증
	SKILL("기술셋"); //기술
	
	@Getter private String description;
}