package com.sierp.web.domain.resource.model;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class User extends Worker {
	
	private int userSeq;
	private int workerSeq;
	
	private Date rejectNoticeEnd;	//언제까지 채용을 받지 않겠다.
	private Date userUpdateYmdt;

	private boolean infoOpen;	//정보 오픈
	private boolean careerOpen;	//커리어 오픈
	
	private boolean foreRecruitTypeVal;	//희망 채용형태가 아니면 안 받겠다.
	private boolean foreWorkPosiTypeVal;
	private boolean foreCompanyType;	//대기업, 중소기업, 스타트업
	private boolean foreRewardYearAmt;	//채용공고가 월보수일때 환산
	private boolean foreRewardMonthAmt;	//채용공고가 연보수일때 환산
}
