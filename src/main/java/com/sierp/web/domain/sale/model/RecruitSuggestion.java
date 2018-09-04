package com.sierp.web.domain.sale.model;

import java.util.Date;

import com.sierp.web.domain.constants.RecruitSuggestionStatus;

import lombok.Data;

/**
 * 채용제안
 *
 */
@Data
public class RecruitSuggestion {

	private int recruitSuggestionSeq;
	
	private String customerCode;
	private String managerId;	//주담당
	
	private RecruitSuggestionStatus currentProgressStatus;
	
	private int jobPositionSeq;
	
	private int workerSeq;
	
	private int companyManagerStaffSeq;
	
	private String secretMemo;
	
	private Date registerYmdt;
}
