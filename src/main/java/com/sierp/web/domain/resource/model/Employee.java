package com.sierp.web.domain.resource.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Employee extends Worker {
	
	private int employeeSeq;
	private int workerSeq;
	
	private int enterYear;	//입사년도
	private int enterMonth;	//입사월
	private int enterDay;	//입사일
	
	private String positionInfo;	//직급정보
	
	private int salary;
}
