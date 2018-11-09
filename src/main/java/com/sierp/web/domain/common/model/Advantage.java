package com.sierp.web.domain.common.model;


import java.sql.Date;

import lombok.Data;

import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.common.constant.SkillSetType;

@Data
public class Advantage {

	private int advantageSeq;
	
	private String customerCode;	//없다면 기본 셋
	
	private String advantageName;
	
	private AdvantageType advantageType;
	private SkillSetType skillSetType;	//advantageType=skill인 경우에만 있음
	
	private String registerManagerId;
	private Date registerYmdt;
}
