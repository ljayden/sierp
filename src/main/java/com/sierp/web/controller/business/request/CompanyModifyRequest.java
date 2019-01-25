package com.sierp.web.controller.business.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class CompanyModifyRequest {

	@NotNull Integer seq;
	@NotEmpty private String name;
	private String bizNo;
	private SidoType sido;
	private SiGunGuType sigungu;
	private String addrDetail;
	private String managerMemo;
}
