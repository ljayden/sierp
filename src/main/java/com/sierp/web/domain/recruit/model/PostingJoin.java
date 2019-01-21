package com.sierp.web.domain.recruit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false) 
public class PostingJoin extends Posting {
	
	private String companyName;
	private String companyStaffName;
	private String projectName;
}

