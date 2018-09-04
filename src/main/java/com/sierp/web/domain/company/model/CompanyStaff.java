package com.sierp.web.domain.company.model;

import java.util.Date;

import lombok.Data;

@Data
public class CompanyStaff {
	
	private int companyStaffSeq;
	private int companySeq;
	
	private String name;
	private String phoneNo;
	private String email;
	
	private String position;
	private String part;
	
	private String memo;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
