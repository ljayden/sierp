package com.sierp.web.domain.common.constant;

import java.util.List;

import com.google.common.collect.Lists;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum SiGunGuType {

	YANGCHEON("양천구", SidoType.SEOUL, 1, 2),
	SUNGNAM_BUNDANG("성남시 분당구", SidoType.GYUNGGI, 3, 12);
	
	@Getter private String description;
	@Getter private SidoType sido;
	@Getter private int positionValueX;
	@Getter private int positionValueY;
	
	public static List<SiGunGuType> getSiGunGu(SidoType sidoType) {
		
		List<SiGunGuType> sigunguList = Lists.newArrayList();
		
		for (SiGunGuType sigungu : values()) {
			if (sigungu.getSido() == sidoType) {
				sigunguList.add(sigungu);
			}
		}
		return sigunguList;
	}
}
