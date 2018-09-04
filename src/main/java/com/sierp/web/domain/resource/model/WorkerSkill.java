package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.constants.SkillSetWorkmanship;

import lombok.Data;

@Data
public class WorkerSkill {

	private int developerSeq;
	private int skillSetSeq;
	
	private SkillSetWorkmanship workmanship; //숙련도
}
