package com.sierp.web.domain.resource.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Freelancer extends Worker {
	
	private int freelancerSeq;
	private int workerSeq;
	
	private Integer userSeq;	//사이트를 가입하면 발생
	
	private String cutomerMemo;
	
	private int hopeRecruitTypeVal;
	private int hopeWorkPosiTypeVal;
	
	private String mainManagerId;
	private String modifyManagerId;		//없으면 본인
	private String registerManagerId;	//없으면 본인
	
	
}