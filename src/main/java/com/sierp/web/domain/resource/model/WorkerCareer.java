package com.sierp.web.domain.resource.model;

import java.util.Date;

import lombok.Data;

@Data
public class WorkerCareer {

	private int workerSeq;
	
	private String position;
	
	private Date startPeriod;
	private Date endPeriod;

	private Date commnent;
}
