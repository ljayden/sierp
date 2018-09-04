package com.sierp.web.domain.project.model;

import java.util.Date;

import com.sierp.web.domain.constants.DevGrade;
import com.sierp.web.domain.constants.JobPositionStatus;
import com.sierp.web.domain.constants.RecruitType;
import com.sierp.web.domain.constants.SiGunGuType;
import com.sierp.web.domain.constants.SidoType;

import lombok.Data;

@Data
public class JobPosition {

	private int jobPositionSeq;
	
	private String customerCode;
	
	private int companySeq;
	private int companyStaffSeq;
	
	private Integer projectSeq;	//채용 정보면 없을 수도
	
	private JobPositionStatus status;
	private Date statusUpdateYmdt;
	
	private String jobPositionName;


	
	
	/**
	 * 프로젝트 - 직무일 때
	 */
	private DevGrade needGrade;	//2개이상은 어케할까?
	private Integer workMonth;	//근무 월수 - 계약 단위
	private Integer monthPay;	//월단가
	
	private RecruitType recruitType; // 정규직,계약직,파트

	private Integer displayPriceMin;
	private Integer displayPriceMax;
	
	private String umm; //필수사항
	private String um; //우대사항? 스킬셋
	private String um1; //1월초부터.... 몇개월 단위.
	
	private String jobInfomation; //직무정보 소개
	private String jobEtcInfomation; //직무부가 정보
	
	private String secretMemo;
	
	private SidoType workSido;
	private SiGunGuType workSiGunGu;
	private String workDetailAddr;
	

	private Date registerYmdt;
	private String resiterManagerId;
}