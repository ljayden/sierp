package com.sierp.web.domain.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum SidoType {

	SEOUL("서울"),
	GYUNGGI("경기"),
	GANGWON("강원"),
	CHUNGBOK("충북"),
	CHUNGNAM("충남"),
	JUNBOK("전북"),
	JUNNAM("전남"),
	GYUNGBOK("경북"),
	GYUNGNAM("경북"),
	BUSAN("부산"),
	DAEGU("대구"),
	INCHEON("인천"),
	DAEJUN("대전"),
	GWANGJU("광주"),
	ULSAN("울산");
	
	@Getter private String description;
}
