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

	private boolean infoOpen;
	private boolean careerOpen;
}
