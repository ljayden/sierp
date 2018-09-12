package com.sierp.web.domain.sale.model;

import java.util.Date;

import com.sierp.web.domain.common.constant.OpenGrade;

import lombok.Data;

@Data
public class ContractWorkerReview {

	private int contractSeq;
	private int workSeq;
	
	private String customerCode;
	private String managerId;	//주담당
	 

	
	private String customerCommentAboutCompany;
	private int customerPointAboutCompany;
	private OpenGrade customerOpinionOpenGradeAboutCompany;
	
	private String customerCommentAboutWorker;
	private int customerPointAboutWorker;
	private OpenGrade customerOpinionOpenGradeAboutWorker;
	
	private String companyCommentAboutWorker;
	private int companyPointAboutWorker;
	private OpenGrade companyOpinionOpenGradeAboutWorker;
	
	private String workerCommentAboutCompany;
	private int workerPointAboutCompany;
	private OpenGrade workerOpinionOpenGradeAboutCompany;
	
	private int jobPositionSeq;
	
	private int companyManagerStaffSeq;
	
	private String secretMemo;
	
	private Date registerYmdt;
}
