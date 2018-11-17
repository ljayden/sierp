package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.common.constant.SkillSetWorkmanship;
import com.sierp.web.domain.common.model.Advantage;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class WorkerAdvantage extends Advantage {

	private int workerSeq;
	private int advantageSeq;
	
	private AdvantageType advantageType; //반정규화로 가지고 있음 ..일단

	private SkillSetWorkmanship workmanship; //숙련도
	private int workmanshipVal;
}
