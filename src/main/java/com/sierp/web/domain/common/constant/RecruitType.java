package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

//채용 타입
@AllArgsConstructor
public enum RecruitType {
	
	REGULAR("정규직", 16),
	TEMPORARY("계약직", 8),
	INTERN("인턴", 4),
	ALBA("아르바이트", 2),
	FREELANCER("프리랜서", 1);
	
	@Getter private String description;
	@Setter private int code;
}
