package com.sierp.web.domain.common.model;

import com.sierp.web.domain.common.constant.SkillSetType;

import lombok.Data;

@Data
public class SkillSet {

	private int skillSetSeq;
	
	private String customerCode;	//없다면 기본 셋
	
	private String skillSetName;
	
	
	private SkillSetType type;
}
