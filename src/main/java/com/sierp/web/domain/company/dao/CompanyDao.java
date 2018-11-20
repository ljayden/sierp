package com.sierp.web.domain.company.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.company.model.CompanySearch;
import com.sierp.web.result.Pager;

@Repository
public class CompanyDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.company.company_dao.";
	
	public List<Map<String, Object>> selectCompany() {
		Map<String, Object> param = Maps.newHashMap();
		return sql.selectList(MAPPER_NAMESPACE + "selectCompany", param);
	}
	
	public Map<String, Object> selectCompanyBySeq(int companySeq) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("companySeq", companySeq);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCompanyBySeq", param);
	}
	
	public void selectCompanyListCount(int customerSeq, String companyName, SidoType sido, SiGunGuType siGunGu, String resisterManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("sido", sido);
		params.put("siGunGu", siGunGu);
		params.put("resisterManagerId", resisterManagerId);
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectCompanyListCount", params));
	}
	
	public List<CompanySearch> selectCompanyList(int customerSeq, String companyName, SidoType sido, SiGunGuType siGunGu, String resisterManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("sido", sido);
		params.put("siGunGu", siGunGu);
		params.put("resisterManagerId", resisterManagerId);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompanyList", params);
	}
}
