package com.sierp.web.controller.business.request;
 
import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;
 

@Data
public class CompanyRegisterRequest {
	
	@NotEmpty private String name;
	
	private String companyIntro;
	private String bizNo;
	private SidoType sido;
	private SiGunGuType sigungu;
	private String addrDetail;
	private String managerMemo;
	
	@Valid private List<CompanyStaffRegisterRequest> staffs;
}