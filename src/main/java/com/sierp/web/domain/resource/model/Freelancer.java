package com.sierp.web.domain.resource.model;


import java.util.Date;

import com.sierp.web.domain.resource.constant.SeekingWorkStatus;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Freelancer extends Worker {
	
	private int freelancerSeq;
	private int workerSeq;
	
	private Integer userSeq;	//사이트를 가입하면 발생
	
	private String customerMemo;
	
	private SeekingWorkStatus seekingWorkStatus; 	//구직상태		
	private Date seekingWorkStatusReConfirmYmd;	//구직 상태 변경 확인일..
	private String seekingWorkRejectCause;		//구직거절사유
	
	private int hopeRecruitTypeVal;	//희망 채용 - 무조건 
	private int hopeWorkPosiTypeVal;
	private int hopeCompanyType;	//대기업, 중소기업, 스타트업
	private int	hopeRewardYearAmt;	//채용공고가 월보수일때 환산
	private int hopeRewardMonthAmt;	//채용공고가 연보수일때 환산

	private String mainManagerId;
	private String modifyManagerId;		//없으면 본인
	private String registerManagerId;	//없으면 본인
	

	
}