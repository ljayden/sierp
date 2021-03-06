package com.sierp.web.domain.recruit.model;

import java.util.Date;

import lombok.Data;

import com.sierp.web.domain.common.constant.RecruitType;
import com.sierp.web.domain.common.constant.RewardType;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.common.constant.WorkType;
import com.sierp.web.domain.recruit.constant.PostingStatus;
import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.FreelancerGrade;

@Data
public class Posting {

	private int postingSeq;
	
	private int customerSeq;
	
	private String postingTitle; //공고명
	private PostingStatus status;
	private Date endYmdt;
	private String sitePostYn;
	
	private Integer companySeq;			
	private Integer companyStaffSeq;
	private Integer projectSeq;	//정규직 채용이라면 프로젝트가 없을수도 있다. 혹은 프로젝트 정보가 없을 수 있지.
	
	private WorkType workType; //SI, SM - 필수 아니다.
	
	private RecruitType recruitType; // 정규직,계약직,프리랜서
	private int recruitManCount;	//채용 명수

	private AcademicLevel needAcademicLevel;
	private Integer needAcademicLevelValue;
	private FreelancerGrade needFreeGrade;
	private Integer needFreeGradeValue;	//FreelancerGrade 참고!!!!  0일 경우 경력으로 구분
	private Integer limitWorkYearMin;		//필요 최소경력 
	private Integer limitWorkYearMax;		//필요 최대경력 
	private Integer limitAgeMin;		//나이제한
	private Integer limitAgeMax;
	
	private Integer recruitContractUnitValue;	//계약 단위
	
	private RewardType rewardType;	//보상구분 연봉-월급
	private Integer rewardMinPrice;	
	private Integer rewardMaxPrice;
	
	
	private SidoType workSido;
	private SiGunGuType workSigungu;
	private String workDetailAddr;
	
	private String officeWorkYn; 		//상주 근무가능여부
	private String officeHomeWorkYn;	//반상주 가능여부
	private String homeWorkYn;			//재택 가능 여부

	private String jobInfo; //직무 & 근무 정보 소개
	private String recruitInfo; //채용조건 부가 정보

	private String managerMemo;
	
	private String mainManagerId;
	private Date registerYmdt;
	private String registerManagerId;
	
	private Date modifyYmdt;
	private String modifyManagerId;
}
