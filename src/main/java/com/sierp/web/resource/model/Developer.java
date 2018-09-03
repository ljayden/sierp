package com.sierp.web.resource.model;

import java.util.Date;

import lombok.Data;

import com.sierp.web.constants.SiGunGuType;
import com.sierp.web.constants.SidoType;

@Data
public class Developer {

	private int developerSeq;
	
	private int statusCode;
	
	private boolean infoOpen;
	private boolean careerOpen;
	
	private String customerCode;
	
	private String name;
	private String loginEmailId;
	private String password; //본인 등록시 - 확인 필요
	
	private String email;	//본인 등록시에만....
	private String phoneNo;
	
	private String birthYear;
	private String birthMonthDay;
	private String sex;
	
	private int startWorkYear;
	
	private String memo;
	private String secretMemo;	// 본인 등록 시 없음
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private Date modifyYmdt;
	
	private String modifyManagerId;		//없으면 본인
	private String resiterManagerId;	//없으면 본인
}
