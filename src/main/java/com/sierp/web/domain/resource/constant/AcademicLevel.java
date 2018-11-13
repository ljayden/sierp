package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum AcademicLevel {
	
	MID_SCH("중학교 졸", 3),
	HIGH_SCH("고등학교 졸", 6),
	JUNMUN_COL("전문학사", 8),
	COLLEGE("학사", 10),
	MASTER("석사", 12),
	DOCTOR("박사", 16);
	
	@Getter private String description;
	@Getter private int val;
}
