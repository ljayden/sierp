package com.sierp.web.controller.recruit.request;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.sierp.web.domain.common.constant.RecruitType;
import com.sierp.web.domain.common.constant.RewardType;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.common.constant.WorkType;
import com.sierp.web.domain.recruit.model.PostingCondition;
import com.sierp.web.domain.resource.constant.AcademicLevel;
import com.sierp.web.domain.resource.constant.FreelancerGrade;

import lombok.Data;

@Data
public class RecruitPostingRegisterRequest {
	
	private String postingTitle;
	@NotEmpty private String sitePostYn;
	private String endYmd;
	
	@NotNull private Integer companySeq;			
	@NotNull private Integer companyStaffSeq;
	private Integer projectSeq;
	
	private WorkType workType;
	
	private RecruitType recruitType;
	private int recruitManCount;

	private AcademicLevel needAcademicLevel;
	private FreelancerGrade needFreeGrade;
	private Integer limitWorkYearMin;
	private Integer limitWorkYearMax;
	private Integer limitAgeMin;
	private Integer limitAgeMax;
	
	private Integer recruitContractUnitValue;
	
	private RewardType rewardType;
	private Integer rewardMinPrice;	
	private Integer rewardMaxPrice;
	
	
	@NotNull private SidoType workSido;
	@NotNull private SiGunGuType workSiGunGu;
	private String workDetailAddr;
	
	@NotEmpty private String officeWorkYn;
	@NotEmpty private String officeHomeWorkYn;
	@NotEmpty private String homeWorkYn;

	private String jobInfo;
	private String recruitInfo;

	private String managerMemo;
	private String mainManagerId;
	
	private List<PostingCondition> needs;
	private List<PostingCondition> prefers;
	
}
