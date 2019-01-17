package com.sierp.web.domain.common.constant;

import java.util.List;

import com.google.common.collect.Lists;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum SiGunGuType {

	GANGNAMGU("강남구", SidoType.SEOUL, 1, 2),
	GANGDONGGU("강동구", SidoType.SEOUL, 1, 2),
	GANGBUKGU("강북구", SidoType.SEOUL, 1, 2),
	GANGSEOGU("강서구", SidoType.SEOUL, 1, 2),
	GWANAKGU("관악구", SidoType.SEOUL, 1, 2),
	GWANGJINGU("광진구", SidoType.SEOUL, 1, 2),
	GUROGU("구로구", SidoType.SEOUL, 1, 2),
	GEUMCHEONGU("금천구", SidoType.SEOUL, 1, 2),
	NOWONGU("노원구", SidoType.SEOUL, 1, 2),
	DOBONGGU("도봉구", SidoType.SEOUL, 1, 2),
	DONGDAEMOONGU("동대문구", SidoType.SEOUL, 1, 2),
	DONGJAKGU("동작구", SidoType.SEOUL, 1, 2),
	MAPOGU("마포구", SidoType.SEOUL, 1, 2),
	SEODAEMOONGU("서대문구", SidoType.SEOUL, 1, 2),
	SEOCHOGU("서초구", SidoType.SEOUL, 1, 2),
	SEONGDONGGU("성동구", SidoType.SEOUL, 1, 2),
	SEONGBUKGU("성북구", SidoType.SEOUL, 1, 2),
	SONGPAGU("송파구", SidoType.SEOUL, 1, 2),
	YANGCHEONGU("양천구", SidoType.SEOUL, 1, 2),
	YEONGDEUNGPOGU("영등포구", SidoType.SEOUL, 1, 2),
	YONGSANGU("용산구", SidoType.SEOUL, 1, 2),
	EUNPYEONGGU("은평구", SidoType.SEOUL, 1, 2),
	JONGNOGU("종로구", SidoType.SEOUL, 1, 2),
	JUNGGU("중구", SidoType.SEOUL, 1, 2),
	JUNGNANGGU("중랑구", SidoType.SEOUL, 1, 2),
	
	 
	GAPYEONGGUN("가평군", SidoType.GYUNGGI, 3, 12),
	GOYANGSI_DUKYANGGU("고양시 덕양구", SidoType.GYUNGGI, 3, 12),
	GOYANGSI_ILSANDONGGU("고양시 일산동구", SidoType.GYUNGGI, 3, 12),
	GOYANGSI_ILSANSEOGU("고양시 일산서구", SidoType.GYUNGGI, 3, 12),
	GWACHEONSI("과천시", SidoType.GYUNGGI, 3, 12),
	GWANGMYEONGSI("광명시", SidoType.GYUNGGI, 3, 12),
	GWANGJUSI("광주시", SidoType.GYUNGGI, 3, 12),
	GURISI("구리시", SidoType.GYUNGGI, 3, 12),

	
	SUNAMSI_BUNGDANGGU("구리시", SidoType.GYUNGGI, 3, 12);
	
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
