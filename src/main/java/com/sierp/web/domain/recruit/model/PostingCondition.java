package com.sierp.web.domain.recruit.model;

import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.common.constant.SkillSetWorkmanship;
import com.sierp.web.domain.recruit.constant.PostingConditionType;

import lombok.Data;

@Data
public class PostingCondition {
	
	private int postingConditionSeq;
	private int postingSeq;
	
	private PostingConditionType conditionType;	//필수, 우대
	
	private int advantageSeq;
	
	private AdvantageType advantageType; //반정규화로 가지고 있음 ..일단

	private SkillSetWorkmanship workmanship; //숙련도
	private int workmanshipVal;
}
