package com.sierp.web.company.model;

import java.util.Date;

import com.sierp.web.constants.SiGunGuType;
import com.sierp.web.constants.SidoType;

import lombok.Data;

@Data
public class Company {

	private String customerCode;
	private String companyCode;
	private String companyName;

	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
