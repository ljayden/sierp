package com.sierp.web.domain.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 스킬 숙련도
 */
@AllArgsConstructor
public enum SkillSetWorkmanship {
	
	MASTER("마스터"),
	TOP("상"),
	MID("중"),
	LOW("하"),
	EXIST("경험있음");
	
	@Getter private String description;
}
