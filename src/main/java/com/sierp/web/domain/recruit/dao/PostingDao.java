package com.sierp.web.domain.recruit.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.recruit.model.Posting;
import com.sierp.web.domain.recruit.model.PostingCondition;
import com.sierp.web.domain.recruit.model.PostingSearch;
import com.sierp.web.result.Pager;

@Repository
public class PostingDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.recruit.posting_dao.";
	
	public int insertPosting(Posting posting) {
		return sql.insert(MAPPER_NAMESPACE + "insertPosting", posting);
	}
	
	public int insertPostingCondition(PostingCondition postingCondition) {
		return sql.insert(MAPPER_NAMESPACE + "insertPostingCondition", postingCondition);
	}
	
	public void selectPostingListCount(String postingYn, String mainManagerId, Integer freelancerGradeValue, String workType, String recruitType, 
										String officeWorkYn, String officeHomeWorkYn, String homeWorkYn, String companyName, List<String> statusList, Date closeStartDate, Date closeEndDate,
										int customerSeq, Pager pager) {
		
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("postingYn", postingYn);
		params.put("mainManagerId", mainManagerId);
		params.put("freelancerGradeValue", freelancerGradeValue);
		params.put("workType", workType);
		params.put("recruitType", recruitType);
		params.put("officeWorkYn", officeWorkYn);
		params.put("officeHomeWorkYn", officeHomeWorkYn);
		params.put("homeWorkYn", homeWorkYn);
		params.put("statusList", statusList);
		params.put("companyName", companyName);
		params.put("closeStartDate", closeStartDate);
		params.put("closeEndDate", closeEndDate);
		params.put("customerSeq", customerSeq);
	
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectPostingListCount", params)); 
	}
	
	public List<PostingSearch> selectPostingList(String postingYn, String mainManagerId, Integer freelancerGradeValue, String workType, String recruitType, 
												String officeWorkYn, String officeHomeWorkYn, String homeWorkYn, String companyName, List<String> statusList, Date closeStartDate, Date closeEndDate,
												int customerSeq, Pager pager) {

		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("postingYn", postingYn);
		params.put("mainManagerId", mainManagerId);
		params.put("freelancerGradeValue", freelancerGradeValue);
		params.put("workType", workType);
		params.put("recruitType", recruitType);
		params.put("officeWorkYn", officeWorkYn);
		params.put("officeHomeWorkYn", officeHomeWorkYn);
		params.put("homeWorkYn", homeWorkYn);
		params.put("statusList", statusList);
		params.put("companyName", companyName);
		params.put("closeStartDate", closeStartDate);
		params.put("closeEndDate", closeEndDate);
		params.put("customerSeq", customerSeq);

		return sql.selectList(MAPPER_NAMESPACE + "selectPostingList", params);
	}
}