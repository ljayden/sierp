package com.sierp.web.domain.resource.model;

import java.util.Date;

import lombok.Data;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.WorkerExpertType;
import com.sierp.web.domain.resource.constant.WorkerType;


/**
 * 최상위 오브젝트 
 * 프리랜서와 직원의 합 !
 *
 *
 * 유니크 : customerCode + email
 */
@Data
public class Worker {

	private int workerSeq;
	
	private WorkerType workerType;	//직원, 프리랜서
	
	private String customerCode;	//NONE : 유저등록 정보
	
	private String name;
	private String email;
	private String phoneNo;
	
	private int birthYear;
	private Integer birthMonth;
	private Integer birthDay;
	private String sex;
	
	private WorkerExpertType workerExpertType;
	
	/**등급 산정 기준 */
	private AcademicLevel academicLevel;
	private int academicLevelVal;
	private Integer careerStartYear;
	private Integer careerStartMonth;
	
	
	private SidoType sido;
	private SiGunGuType siGunGu;
	private String detailAddr;
	
	private Date registerYmdt;
	private Date modifyYmdt;
}
