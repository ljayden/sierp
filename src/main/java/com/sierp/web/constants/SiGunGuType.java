package com.sierp.web.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum SiGunGuType {

	SU_YANGCHEON("양천구", SidoType.SEOUL, 1, 2),
	ULSAN("성남시 분담구", SidoType.GYUNGGI, 3, 12);
	
	@Getter private String description;
	@Getter private SidoType sido;
	@Getter private int positionValueX;
	@Getter private int positionValueY;
}
