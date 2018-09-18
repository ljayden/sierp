package com.sierp.web.domain.sale.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum RecruitSuggestionProgressStatus {
	
	RSPS1("개발자 제안"),
	RSPS2("업체 추천"),
	RSPS3("면접 진행중"),
	RSPS4("처우 협의"),	//처우 협의
	RSPS5("업체 협의"),	//업체 추천
	RSPS6("계약 완료"),
	RSPS7("실패");
	
	@Getter private String description;
}
