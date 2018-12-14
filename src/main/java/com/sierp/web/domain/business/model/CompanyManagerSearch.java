package com.sierp.web.domain.business.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CompanyManagerSearch extends CompanyStaff {

	 private String companyName;
}