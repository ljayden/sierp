package com.sierp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;

@Repository
public class CompanyDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.company.company_dao.";
	
	public List<Map<String,Object>> selectCompany() {
		Map<String, Object> param = Maps.newHashMap();
		return sql.selectList(MAPPER_NAMESPACE + "selectCompany", param);
	}
	
	public Map<String,Object> selectCompanyByCode(String code) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("companyCode", code);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCompanyByCode", param);
	}
}
