package com.sierp.web.project.model;

import java.util.Date;

import com.sierp.web.constants.DevGrade;
import com.sierp.web.constants.RecruitType;
import com.sierp.web.constants.SiGunGuType;
import com.sierp.web.constants.SidoType;
import com.sierp.web.constants.WorkType;

import lombok.Data;

@Data
public class JobPosition {

	private int jobPositionSeq;
	
	private String customerCode;
	
	private Integer projectSeq;
	
	private boolean close; //프로젝트 마감
	
	private WorkType workType;	//SI, SM
	private RecruitType recruitType; // 정규직,임시직,파트
	
	private DevGrade needGrade;	//2개이상은 어케할까?
	private Integer workExperienceMin;
	private Integer workExperienceMax;
	
	private Integer monthPay;
	private Integer yearPay;
	private String displayPriceInfo;
	
	private Date startYmdt;
	private Date endYmdt;
	
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