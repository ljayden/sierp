package com.sierp.web.controller.resource.request;


import com.sierp.web.domain.common.constant.SkillSetWorkmanship;

import lombok.Data;

@Data
public class FreelancerRegisterRequesSkill {

	private int advantageSeq;
	private SkillSetWorkmanship skillSetWorkmanship; //숙련도
}
