package com.sierp.web.domain.resource.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum WorkerExpertType {

	SW_DEV("SW개발", false),
	SW_DEV_WEB("엡 개발", true),
	SW_DEV_APP("앱 개발", true),
	SW_DEV_WIN("윈도우개발", true),
	SW_DEV_GAME("게임개발", true),
	
	HW_DEV("hw개발", false),
	
	DATA_SI("데이터분석", false),
	
	ENGINEER("시스템관리자", false),
	ENGINEER_DBA("DBA", true),
	ENGINEER_NET("노트워크 관리", true),
	ENGINEER_SERVER("서버 관리", true),
	ENGINEER_SECU("정보보안", true),
	
	PUBLISH("퍼블리싱", false),
	
	DESIGN("디자인", false),
	
	PLANNER("기획/PM", false),
	
	QA("QA", false),
	
	CONSULT("컨설턴트", false),
	
	ENG_SALE("기술영업", false);
	

	
	@Getter private String description;
	@Getter private boolean datail;
}