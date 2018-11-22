package com.sierp.web.domain.company.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CompanyManagerSearch extends CompanyStaff {

	 private String companyName;
}