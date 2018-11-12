package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 스킬 숙련도
 */
@AllArgsConstructor
public enum SkillSetWorkmanship {
	
	MASTER("마스터"),
	TOP("고급"),
	MID("중급"),
	LOW("초급"),
	EXIST("경험있음");
	
	@Getter private String description;
}
