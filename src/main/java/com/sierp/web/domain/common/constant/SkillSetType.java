package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 필요한가 고민
 *
 */
@AllArgsConstructor
public enum SkillSetType {

	EXPERT("언어/공통/전문"),
	SERVER_DEVELOP("서버개발"),
	CLIENT_DEVELOP("클라이언트개발"),
	APP_DEVELOP("APP개발"),
	WEB_DEVELOP("웹개발"),
	PUBL_DESIGN("퍼블리싱/디자인");
	
	
	@Getter private String description;
}

