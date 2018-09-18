package com.sierp.web.domain.project.model;

import java.util.Date;

import lombok.Data;

/**
 * 자사 직원 - 프로젝트에 투입(파견)
 *
 */
@Data
public class Dispatch {

	private int dispatchSeq;
	
	private int employeeSeq;
	
	private int jobPositionSeq;
	
	private Date workStartDate;
	
	private Date workEndDate;
	
	private int offeringPrice;
	
	private int cost;
	
	//역할
	
	//메모
}
