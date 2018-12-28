package com.sierp.web.domain.business.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.business.model.Project;
import com.sierp.web.domain.business.model.ProjectSearch;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.result.Pager;

@Repository
public class ProjectDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.business.project_dao.";
	
	public int insertProject(Project project) {
		return sql.insert(MAPPER_NAMESPACE + "insertProject", project);
	}
	
	public void selectProjectListCount(int customerSeq, Integer companySeq, String companyName, String projectName, List<String> statusList,
										SidoType sido, SiGunGuType sigungu, String mainManagerId, Pager pager, Date now) {

		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("companySeq", companySeq);
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("projectName", projectName);
		params.put("sido", sido);
		params.put("sigungu", sigungu);
		params.put("mainManagerId", mainManagerId);
		params.put("statusList", statusList);
		params.put("now", now);
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectProjectListCount", params)); 
	}

	public List<ProjectSearch> selectProjectList(int customerSeq, Integer companySeq, String companyName, String projectName, List<String> statusList,
													SidoType sido, SiGunGuType sigungu, String mainManagerId, Pager pager, Date now) {
	
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("companySeq", companySeq);
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("projectName", projectName);
		params.put("sido", sido);
		params.put("sigungu", sigungu);
		params.put("mainManagerId", mainManagerId);
		params.put("statusList", statusList);
		params.put("now", now);
		return sql.selectList(MAPPER_NAMESPACE + "selectProjectList", params);
	}
} 

  