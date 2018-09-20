package com.sierp.web.domain.company.dao;

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
	
	public List<Map<String, Object>> selectCompany() {
		Map<String, Object> param = Maps.newHashMap();
		return sql.selectList(MAPPER_NAMESPACE + "selectCompany", param);
	}
	
	public Map<String, Object> selectCompanyBySeq(int companySeq) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("companySeq", companySeq);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCompanyBySeq", param);
	}
}
