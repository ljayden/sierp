package com.sierp.web.controller.business.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class CompanyStaffModifyRequest {

	@NotNull private Integer seq;
	@NotEmpty private String name;
	private String phoneNo;
	private String companyPhoneNo;
	private String email;
	
	private String position;	//직급
	private String part;	//부서
	
	private String memo;	//메모
}
