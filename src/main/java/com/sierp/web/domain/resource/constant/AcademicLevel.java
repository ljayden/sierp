package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum AcademicLevel {
	
	MID_SCH("중학교 졸"),
	HIGH_SCH("고등학교 졸"),
	JUNMUN_COL("전문학사"),
	COLLEGE("학사"),
	MASTER("석사"),
	DOCTOR("박사");
	
	@Getter private String description;
}
