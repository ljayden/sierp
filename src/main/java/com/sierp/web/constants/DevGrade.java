package com.sierp.web.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum DevGrade {

	LOW("초급"),
	MID("중급"),
	HIGH("고급"),
	SPEC("특급");
	
	@Getter private String descripion;
}
