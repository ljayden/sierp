package com.sierp.web.domain.business.model;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;

import lombok.Data;

@Data
public class ProjectSearch {

	private int projectSeq;
	private String companyName;
	private String mainCompanyName;
	
	private int companySeq;
	private Integer mainCompanySeq;
	
	private String endYn;
	
	private String projectName;
	
	private Integer startYear;
	private Integer startMonth;
	private Integer startDay;
	
	private Date startYmdt;
	private Date endYmdt;
	
	private Integer endYear;
	private Integer endMonth;
	private Integer endDay;
	
	private SidoType sido;
	private SiGunGuType sigungu;
	
	private Date now = new Date();
	
	public String getStartYmd() {
		return getDateStr(startYear, startMonth, startDay);
	}
	
	public String getEndYmd() {
		return getDateStr(endYear, endMonth, endDay);
	}
	
	private String getStatus() {
		
		
		if (StringUtils.equalsAnyIgnoreCase("Y", endYn)) {
			return "END";
		}
		
		if (startYmdt != null) {
			//시작기간이 입력되었으니..
			if (startYmdt.getTime() > now.getTime()) {
				//시작되었다면..
			} else {
				//시작되지 않았다면...
				return "READY";
			}
		} else {
			//시작기간이 없다.
		}
	}
	
	private String getDateStr(Integer year, Integer month, Integer day) {
		if (year == null) {
			return "";
		}
		
		String result = year.toString();
		if (month != null) {
			result = result + ".";
			if (month < 10) {
				result = result + "0" + month;
			} else {
				result = result + month;
			}
		} else {
			return result;
		}
		
		if (day != null) {
			result = result + ".";
			if (day < 10) {
				result = result + "0" + day;
			} else {
				result = result + day;
			}
		} else {
			return result;
		}
		return result;
	}
}
