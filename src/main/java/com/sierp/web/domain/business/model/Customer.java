package com.sierp.web.domain.business.model;

import lombok.Data;

/**
 * 고객사
 * 
 * 시스템 이용사
 */

@Data
public class Customer {
	
	private int customerSeq;
	private String customerCode;
	private String customerName;
	
	private int companySeq;	//고객사도 업체 정보로 등록된다. 사업자번호로 조회
	private String serviceType;
}
