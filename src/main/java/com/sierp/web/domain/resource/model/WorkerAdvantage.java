package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.common.constant.SkillSetWorkmanship;

import lombok.Data;

@Data
public class WorkerAdvantage {

	private int workerSeq;
	private int advantageSeq;
	
	private AdvantageType advantageType; //반정규화로 가지고 있음 ..일단

	private SkillSetWorkmanship workmanship; //숙련도
}
