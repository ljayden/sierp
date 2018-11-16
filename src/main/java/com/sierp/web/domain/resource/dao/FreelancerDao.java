package com.sierp.web.domain.resource.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.resource.constant.WorkerExpertType;
import com.sierp.web.domain.resource.model.Freelancer;
import com.sierp.web.domain.resource.model.FreelancerSearch;
import com.sierp.web.result.Pager;

@Repository
public class FreelancerDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.resource.freelancer_dao.";
	
	public int insertFreelancer(Freelancer freelancer) {
		return sql.insert(MAPPER_NAMESPACE + "insertFreelancer", freelancer);
	}

	public void selectFreelancerListCount(String name, Integer minAcademicLevel, Integer maxAcademicLevel, String mainManagerId, 
										WorkerExpertType workerExpertType, int workBaseYear, int workBaseMonth, int customerSeq, 
										List<Integer> advantageList, List<Map<String, Object>> skillSetList, Pager pager) {
		
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("name", name);
		params.put("minAcademicLevelVal", minAcademicLevel);
		params.put("maxAcademicLevelVal", maxAcademicLevel);
		params.put("mainManagerId", mainManagerId);
		params.put("workerExpertType", workerExpertType == null ? null : workerExpertType.name());
		params.put("workBaseYear", workBaseYear);
		params.put("workBaseMonth", workBaseMonth);
		params.put("advantageList", advantageList);
		params.put("skillSetList", skillSetList);
		params.put("customerSeq", customerSeq);
	
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectFreelancerListCount", params)); 
	}
	
	public List<FreelancerSearch> selectFreelancerList(String name, Integer minAcademicLevel, Integer maxAcademicLevel, String mainManagerId, 
										WorkerExpertType workerExpertType, int workBaseYear, int workBaseMonth, int customerSeq, 
										List<Integer> advantageList, List<Map<String, Object>> skillSetList, Pager pager) {
		
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("name", name);
		params.put("minAcademicLevelVal", minAcademicLevel);
		params.put("maxAcademicLevelVal", maxAcademicLevel);
		params.put("mainManagerId", mainManagerId);
		params.put("workerExpertType", workerExpertType == null ? null : workerExpertType.name());
		params.put("workBaseYear", workBaseYear);
		params.put("workBaseMonth", workBaseMonth);
		params.put("advantageList", advantageList);
		params.put("skillSetList", skillSetList);
		params.put("customerSeq", customerSeq);
		
		return sql.selectList(MAPPER_NAMESPACE + "selectFreelancerList", params);
	}
}