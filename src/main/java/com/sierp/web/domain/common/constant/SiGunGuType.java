package com.sierp.web.domain.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum SiGunGuType {

	SU_YANGCHEON("양천구", SidoType.SEOUL, 1, 2),
	SUNGNAM_BUNDANG("성남시 분담구", SidoType.GYUNGGI, 3, 12);
	
	@Getter private String description;
	@Getter private SidoType sido;
	@Getter private int positionValueX;
	@Getter private int positionValueY;
}