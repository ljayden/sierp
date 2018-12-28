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
	
	public String getStatusName() {
		String status = getStatus();
		if (StringUtils.equalsIgnoreCase("READY", status)) {
			return "준비";
		} else if (StringUtils.equalsIgnoreCase("ING", status)) {
			return "진행중";
		} else {
			return "종료";
		}
	}
	
	public String getStatusColorClass() {
		String status = getStatus();
		if (StringUtils.equalsIgnoreCase("READY", status)) {
			return "table-success";
		} else if (StringUtils.equalsIgnoreCase("ING", status)) {
			return "";
		} else {
			return "table-secondary";
		}
	}
	
	private String getStatus() {
		
		
		if (StringUtils.equalsAnyIgnoreCase("Y", endYn)) {
			return "END";
		}
		
		if (startYmdt != null) {
			//시작기간이 입력되었으니..
			if (startYmdt.getTime() < now.getTime()) {
				//시작되었다면..
				if (endYmdt == null) {
					//종료기간이 없으니. 진행중인거지..
					return "ING";
				} else {
					//종료기간이 있다.
					if (endYmdt.getTime() < now.getTime()) {
						//
						return "END";
					} else {
						return "ING";
					}
				}
			} else {
				//시작되지 않았다면...
				return "READY";
			}
		} else {
			//시작기간이 없다.
			if (endYmdt == null) {
				//종료기간도 입력되지 않았으니. 진행중인거지..
				return "ING";
			} else {
				//종료기간은 있다.
				if (endYmdt.getTime() < now.getTime()) {
					return "END";
				} else {
					return "ING";
				}
			
			}
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
