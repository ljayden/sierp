package com.sierp.web.domain.business.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum CompanyType {

	NORMAL("IT업체"),
	SI("SI업체"),
	SOLUTION("솔루션업체"),
	PARTNER("파트너사");
	
	@Getter private String descripion;
}
