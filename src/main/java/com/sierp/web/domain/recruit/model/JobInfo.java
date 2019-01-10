package com.sierp.web.domain.recruit.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.RecruitType;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.common.constant.WorkType;
import com.sierp.web.domain.recruit.constant.PostingStatus;
import com.sierp.web.domain.resource.constant.AcademicLevel;

import lombok.Data;


/**
 * 직무 정보
 * 
 * 직무 정보 + 직무 요건의 합
 * 
 * 그룹웨어에서 관리하기는 이모든것이 하나로 이루어진다.
 * 번거롭게 하지말자.!!
 */
@Data
public class JobInfo {

	private int jobPositionSeq;
	
	private String customerCode;
	
	private int companySeq;			//클라이언트 업체
	private int companyStaffSeq;	//클라이언트 업체-담당자
	
	private Integer projectSeq;	//정규직 채용이라면 프로젝트가 없을수도 있다. 혹은 프로젝트 정보가 없을 수 있지.
	
	
	
	/**
	 * 직무 & 근무 정보
	 */
	private WorkType workType; //SI, SM
	private SidoType workSido;
	private SiGunGuType workSiGunGu;
	private String workDetailAddr;
	
	
	private String jobPositionName;
	private String jobPositionInfo; //직무 & 근무 정보 소개
	
	private String secretMemo;
	
	
	///////////// 파견 직무는 여기까지만 있으면 된다.///////////////////////////////
	
	
	/**
	 * 직무 요건 + 채용 공고
	 */
	private RecruitType recruitType; // 정규직,계약직,프리
	
	private String recruitNoticeName; //공고명

	private PostingStatus status;
	
	private String officeWorkYn; //상주 근무가능여부
	private String officeHomeWorkYn;	//반상주 가능여부
	private String homeWorkYn;	//재택 가능 여부

	private AcademicLevel needAcademicLevel;
	private Integer needFreeGradeValue;	//FreelancerGrade 참고!!!!  0일 경우 경력으로 구분
	private Integer needWorkYear;		//필요 경력 
	
	private int recruitContractUnitValue;	//계약 단위
	
	private Integer displayPriceMin;	
	private Integer displayPriceMax;
	
	private int recruitManCount;	//채용 명수
	

	private String jobEtcInfomation; //채용조건 부가 정보
	
	private Date registerYmdt;
	private String resiterManagerId;
	
	private String endYn;
}