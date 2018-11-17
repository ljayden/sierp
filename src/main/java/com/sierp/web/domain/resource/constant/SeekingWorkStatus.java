package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

//구직 상태
@AllArgsConstructor
public enum SeekingWorkStatus {

	ING("구직 중"),
	REJECT("구직 거절"),
	WORKING("근무 중");
	
	@Getter String description;
}
