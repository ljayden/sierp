package com.sierp.web.controller.business.request;

import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CompanyManagerSearchRequest extends Pager {

	private String companyName;
	private String companyStaffName;
	
	private String phoneNo;
	private String registerManagerId;
	
}