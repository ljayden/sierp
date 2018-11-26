package com.sierp.web.domain.company.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.domain.company.model.Company;
import com.sierp.web.domain.company.model.CompanyManagerSearch;
import com.sierp.web.domain.company.model.CompanySearch;
import com.sierp.web.domain.company.model.CompanyStaff;
import com.sierp.web.result.Pager;

@Repository
public class CompanyDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.company.company_dao.";
	
	public int insertCompany(Company company) {
		return sql.insert(MAPPER_NAMESPACE + "insertCompany", company);
	}

	public int insertCompanyStaff(CompanyStaff companyStaff) {
		return sql.insert(MAPPER_NAMESPACE + "insertCompanyStaff", companyStaff);
	}
	
	
	public List<Company> selectCompany() {
		Map<String, Object> param = Maps.newHashMap();
		return sql.selectList(MAPPER_NAMESPACE + "selectCompany", param);
	}
	
	public List<CompanyStaff> selectCompanyStaffListByCompanySeq(int companySeq) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("companySeq", companySeq);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompanyStaffListByCompanySeq", params);
	}
	
	public Company selectCompanyBySeq(int companySeq) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("companySeq", companySeq);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCompanyBySeq", param);
	}
	
	public void selectCompanyListCount(int customerSeq, String companyName, SidoType sido, SiGunGuType siGunGu, String registerManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("sido", sido);
		params.put("siGunGu", siGunGu);
		params.put("registerManagerId", registerManagerId);
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectCompanyListCount", params));
	}
	
	public List<CompanySearch> selectCompanyList(int customerSeq, String companyName, SidoType sido, SiGunGuType siGunGu, String registerManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("sido", sido);
		params.put("siGunGu", siGunGu);
		params.put("registerManagerId", registerManagerId);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompanyList", params);
	}
	
	public void selectCompanyStaffListCount(int customerSeq, String companyName, String companyStaffName, String phoneNo, String registerManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("companyStaffName", companyStaffName);
		params.put("phoneNo", phoneNo);
		params.put("registerManagerId", registerManagerId);
		pager.setTotalCount(sql.selectOne(MAPPER_NAMESPACE + "selectCompanyStaffListCount", params));
	}
	
	public List<CompanyManagerSearch> selectCompanyStaffList(int customerSeq, String companyName, String companyStaffName, String phoneNo, String registerManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("companyStaffName", companyStaffName);
		params.put("phoneNo", phoneNo);
		params.put("registerManagerId", registerManagerId);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompanyStaffList", params);
	}
}