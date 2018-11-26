package com.sierp.web.controller.project.request;

import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProjectSearchRequest extends Pager {

	private String companyName;
	private String projectName;

	private String mainManagerId;
	
	private String startYmd;
	private String endYmd;
}