package com.sierp.web.domain.business.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class Company {

	private int companySeq;
	
	private int customerSeq;	//0경우 없는거
	private String companyName;
	private String companyIntro;	//업체 소개 - 채용제안서에 찍히는 정보
	private String bizNo;			//과연 사업자 번호를 받아야 하는가...
	
	private SidoType sido;
	private SiGunGuType sigungu;
	private String detailAddr;
	
	private String managerMemo;
	private Date registerYmdt;
	private String registerManagerId;
	private Date modifyYmdt;
	private String modifyManagerId;
}
