package com.sierp.web.domain.business.model;

import java.util.Date;

import lombok.Data;

/**
 * 업체 (인사) 담당자 
 */
@Data
public class CompanyStaff {
	
	private int companyStaffSeq;
	private int companySeq;
	
	private String name;
	private String phoneNo;
	private String companyPhoneNo;
	private String email;
	
	private String position;	//직급
	private String part;	//부서
	
	private String managerMemo;
	
	private Date registerYmdt;
	private String registerManagerId;	//담당자
	private Date modifyYmdt;
	private String modifyManagerId;
}
