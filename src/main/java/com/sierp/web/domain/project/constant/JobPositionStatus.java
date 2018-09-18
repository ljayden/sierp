package com.sierp.web.domain.project.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum JobPositionStatus {
	
	ING("진행중"),
	OUT("마감"),
	END("종료"),
	CONTRACT("타계약-종료");
	
	
	
	
	@Getter private String descripion;
}
