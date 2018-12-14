package com.sierp.web.domain.business.model;

import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 시스템을 이용하는 관리자
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CustomerManager extends Customer {

	private String id;
	private String email;
	private String password;
	private String name;
	private String phoneNo;
	private String position;
}
