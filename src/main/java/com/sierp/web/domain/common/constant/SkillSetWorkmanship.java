package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 스킬 숙련도
 */
@AllArgsConstructor
public enum SkillSetWorkmanship {
	
	MASTER("마스터", 9),
	TOP("고급", 7),
	MID("중급", 5),
	LOW("초급", 3),
	EXIST("경험있음", 1);
	
	@Getter private String description;
	@Getter private int val;
}
