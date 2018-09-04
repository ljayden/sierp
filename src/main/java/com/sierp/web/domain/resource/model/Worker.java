package com.sierp.web.domain.resource.model;

import java.util.Date;

import lombok.Data;

import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;

@Data
public class Worker {

	private int workerSeq;
	
	private int statusCode;
	
	private String customerCode;
	
	private String name;
	private String email;
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
