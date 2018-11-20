package com.sierp.web.controller.business.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.result.Pager;

@Data
@EqualsAndHashCode(callSuper = false)
public class CompanySearchRequest extends Pager {

	private String companyName;
	private String registerManagerId;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	
}