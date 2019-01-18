package com.sierp.web.domain.recruit.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum PostingStatus {
	
	ING("진행중"),
	CONTRACT("계약"),
	END("종료");
	
	
	
	
	@Getter private String description;
}
