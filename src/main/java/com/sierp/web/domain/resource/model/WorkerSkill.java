package com.sierp.web.domain.resource.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.SkillSetWorkmanship;

import lombok.Data;

@Data
public class WorkerSkill {

	private int workerSeq;
	private int skillSetSeq;
	
	private SkillSetWorkmanship workmanship; //숙련도
	
	private Date registerYmdt;
	private Date updateYmdt;
}
