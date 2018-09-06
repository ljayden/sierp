package com.sierp.web.domain.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum WorkPosiType {

	OFFICE("상주"),
	HOMEFICE("반상주"),
	HOME("재택");
	
	@Getter private String description;
}
