package com.sierp.web.company.model;

import java.util.Date;

import lombok.Data;

@Data
public class CompanyStaff {

	private String name;
	private String phoneNo;
	
	private String position;
	private String part;
	
	private String memo;
	
	private Date registerYmdt;
	private String resiterManagerId;
}
