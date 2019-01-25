package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

//채용 타입
@AllArgsConstructor
public enum RecruitType {
	
	REGULAR("정규직", 16),
	FREELANCER("프리랜서", 8),
	TEMPORARY("계약직", 4),
	INTERN("인턴", 2),
	ALBA("아르바이트", 1);
	
	@Getter private String description;
	@Setter @Getter private int code;
}
