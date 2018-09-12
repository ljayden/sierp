package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum JobPositionStatus {
	
	ING("진행중"),
	OUT("마감"),
	END("종료"),
	CONTRACT("계약");
	
	
	
	
	@Getter private String descripion;
}
