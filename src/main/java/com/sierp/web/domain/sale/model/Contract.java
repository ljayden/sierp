package com.sierp.web.domain.sale.model;

import java.util.Date;

import lombok.Data;

//계약
@Data
public class Contract {
	
	private int contractSeq;
	private Integer recruitSuggestionSeq;
	
	private String customerCode;
	private String managerId;	//주담당
	
	private Date workStartYmdt;
	private Date workEndYmdt;
	
	private int depositDay;
	private int depositAmount;
	
	private int withdrawDay;
	private int withdrawAmount;
	
	private String bankCode;
	private String accountNo;
	
	private int jobPositionSeq;
	
	private int developerSeq;
	
	private int companyManagerStaffSeq;
	
	private String secretMemo;
	
	private Date registerYmdt;
}
