package com.sierp.web.domain.resource.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Freelancer extends Worker {

	private int statusCode; //구직 상태같은거?
	
	private String cutomerMemo;

	private String modifyManagerId;		//없으면 본인
	private String resiterManagerId;	//없으면 본인
}
