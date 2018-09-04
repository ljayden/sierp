package com.sierp.web.domain.sale.model;

import java.util.Date;

import com.sierp.web.domain.constants.RecruitSuggestionStatus;

import lombok.Data;

/**
 * 채용제안 진행이력
 *
 */
@Data
public class RecruitSuggestionHist {

	private int recruitSuggestionHistSeq;
	
	private int recruitSuggestionSeq;
	
	private RecruitSuggestionStatus progressStatus;
	 
	private String managerOpinion;
	private String companyOpinion;
	private String developerOpinion;
	
	
	private Date registerYmdt;
	private String resiterManagerId;
}
