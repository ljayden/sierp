package com.sierp.web.domain.resource.model;

import java.util.Date;

import lombok.Data;

import com.sierp.web.domain.constants.AcademicLevel;
import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;
import com.sierp.web.domain.constants.WorkerType;


/**
 * 최상위 오브젝트 
 * 프리랜서와 직원의 합 !
 * @author NHNEnt
 *
 */
@Data
public class Worker {

	private int workerSeq;
	
	private WorkerType workerType;

	
	private String customerCode;
	
	private String name;
	private String email;
	private String phoneNo;
	
	private String birthYear;
	private String birthMonthDay;
	private String sex;
	
	/**등급 산정 기준 */
	private AcademicLevel academicLevel;
	private int startWorkYear;
	private int startWorkMonth;
	
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private Date modifyYmdt;
}
