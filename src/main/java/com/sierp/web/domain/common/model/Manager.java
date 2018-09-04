package com.sierp.web.domain.common.model;

import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 시스템을 이용하는 관리자
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Manager extends Customer {

	private String id;
	private String email;
	private String password;
	private String name;
	private String phoneNo;
	private String position;
}
