package com.sierp.web.domain.sale.model;

import java.util.Date;

import com.sierp.web.domain.sale.constant.RecruitSuggestionProgressStatus;

import lombok.Data;

/**
 * 채용제안
 *
 */
@Data
public class RecruitSuggestion {

	private int recruitSuggestionSeq;
	
	private String customerCode;
	private String managerId;
	
	private RecruitSuggestionProgressStatus currentProgressStatus;
	
	private int jobPositionSeq;
	
	private int freelancerSeq;
	
	private String secretMemo;
	
	private Date registerYmdt;
}
