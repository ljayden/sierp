package com.sierp.web.domain.resource.model;

import com.sierp.web.domain.resource.constant.AcademicEndType;
import com.sierp.web.domain.resource.constant.AcademicLevel;

import lombok.Data;

@Data
public class WorkerSchool {

	private int workerSchoolSeq;
	private int workerSeq;
	
	private AcademicLevel academicLevel;
	private AcademicEndType academicEndType;
	private String schoolName;
	
	private String startYm;
	private String endYm;
}
