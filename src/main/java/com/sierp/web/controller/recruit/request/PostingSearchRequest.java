package com.sierp.web.controller.recruit.request;

import java.util.List;

import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PostingSearchRequest extends Pager {


	private String closeStart;
	private String closeEnd;
	
	private List<String> status;
	private String postingYn;
	
	private String freelancerGrade;
	private String workType;
	
	private String recruitType;
	private String companyName;
	
	 
	String officeWorkYn;
	String officeHomeWorkYn;
	String homeWorkYn;
	
	private String mainManagerId;
	
}
