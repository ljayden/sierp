package com.sierp.web.domain.resource.model;

import java.util.Date;

import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;

import lombok.Data;

@Data
public class User {

	private int userSeq;
	
	private boolean infoOpen;
	private boolean careerOpen;
	
	private String name;
	private String loginEmailId;
	private String password; //본인 등록시 - 확인 필요
	
	private String phoneNo;
	
	private String birthYear;
	private String birthMonthDay;
	private String sex;
	
	private int startWorkYear;
	
	private String memo;
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private Date modifyYmdt;
}
