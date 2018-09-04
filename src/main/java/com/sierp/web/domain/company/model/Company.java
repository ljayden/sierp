package com.sierp.web.domain.company.model;

import java.util.Date;

import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;

import lombok.Data;

@Data
public class Company {

	private int companySeq;
	
	private String customerCode;
	private String companyName;
	
	private String bizNo;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
