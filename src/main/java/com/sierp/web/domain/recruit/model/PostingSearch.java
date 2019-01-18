package com.sierp.web.domain.recruit.model;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.sierp.web.domain.recruit.constant.PostingStatus;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false) 
public class PostingSearch extends Posting {
	
	private String companyName;
	private String companyStaffName;
	private String projectName;
	
	//0:당일 마감 ,  -1:마감됨    -2: 마감정보없음
	public int getEndLeftDay() {
		
		if (getEndYmdt() == null) {
			return -2;
		}
		
		Date now = new Date();
		if (now.getTime() < getEndYmdt().getTime()) {
			long leftTime = getEndYmdt().getTime() - now.getTime();
			return (int) (leftTime / (1000 * 60 * 60 * 24));
		} else {
			return -1;
		}
	}
	
	public String getSitePostingStatusInfo() {
		if (StringUtils.equalsAnyIgnoreCase("Y", getSitePostYn())) {
			
			if (getStatus() == PostingStatus.ING) {
				
				if (getEndYmdt() == null) {
					return "게시중";
				}
				
				Date now = new Date();
				if (now.getTime() > getEndYmdt().getTime()) {
					return "";
				} else {
					return "게시중";
				}
			} else {
				return "";
			}
		} else {
			return "";
		}
	}
}

