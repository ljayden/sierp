package com.sierp.web.domain.common.model;

import com.sierp.web.domain.constants.SkillSetType;

import lombok.Data;

@Data
public class SkillSet {

	private int skillSetSeq;
	private String skillSetName;
	
	private String customerCode;	//없다면 기본 셋
	private SkillSetType type;
}
