package com.sierp.web.domain.company.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class Company {

	private int companySeq;
	
	private String customerCode;	//NONE일 경우 고객사가 등록한 정보
	private String companyName;
	
	private String bizNo;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private String registerManagerId;
}
