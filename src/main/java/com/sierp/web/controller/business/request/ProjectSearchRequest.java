package com.sierp.web.controller.business.request;

import java.util.List;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProjectSearchRequest extends Pager {
	
	private int projectSeq;
	private String companyName;
	private String projectName;

	private String mainManagerId;
	
	private String startYmd;
	private String endYmd;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	
	private List<String> status;
}