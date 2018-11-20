package com.sierp.web.domain.company.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
 
@Data
@EqualsAndHashCode(callSuper = false)
public class CompanySearch extends Company {

	
	private int managerCount = 1;
	private int contractTotalCount = 4;
	private int contractIngCount = 2;
}
