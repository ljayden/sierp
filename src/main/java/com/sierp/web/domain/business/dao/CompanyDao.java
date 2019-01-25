package com.sierp.web.domain.business.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.sierp.web.domain.business.model.Company;
import com.sierp.web.domain.business.model.CompanyStaffSearch;
import com.sierp.web.domain.business.model.CompanySearch;
import com.sierp.web.domain.business.model.CompanyStaff;
import com.sierp.web.domain.common.constant.SiGunGuType;
import com.sierp.web.domain.common.constant.SidoType;
import com.sierp.web.result.Pager;

@Repository
public class CompanyDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.business.company_dao.";
	
	public int insertCompany(Company company) {
		return sql.insert(MAPPER_NAMESPACE + "insertCompany", company);
	}

	public int insertCompanyStaff(CompanyStaff companyStaff) {
		return sql.insert(MAPPER_NAMESPACE + "insertCompanyStaff", companyStaff);
	}
	
	
	public List<Company> selectCompanyList(int customerSeq) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("customerSeq", customerSeq);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompany", param);
	}
	
	public CompanyStaff selectCompanyStaffBySeq(int companyStaffSeq) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("companyStaffSeq", companyStaffSeq);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCompanyStaffBySeq", params);
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
	
	public List<CompanyStaffSearch> selectCompanyStaffList(int customerSeq, String companyName, String companyStaffName, String phoneNo, String registerManagerId, Pager pager) {
		Map<String, Object> params = pager.initParamMapWithPager();
		params.put("customerSeq", customerSeq);
		params.put("companyName", companyName);
		params.put("companyStaffName", companyStaffName);
		params.put("phoneNo", phoneNo);
		params.put("registerManagerId", registerManagerId);
		return sql.selectList(MAPPER_NAMESPACE + "selectCompanyStaffList", params);
	}
	
	public int updateCompany(int companySeq, String name, String bizNo, SidoType sido, SiGunGuType sigungu, String detailAddr, String managerMemo, String managerId) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("companySeq", companySeq);
		params.put("companyName", name);
		params.put("bizNo", bizNo);
		params.put("sido", sido);
		params.put("siGunGu", sigungu);
		params.put("detailAddr", detailAddr);
		params.put("managerMemo", managerMemo);
		params.put("modifyYmdt", new Date());
		params.put("modifyManagerId", managerId);
		return sql.update(MAPPER_NAMESPACE + "updateCompany", params);
	}

	public int updateCompanyStaff(int companyStaffSeq, String name, String phoneNo, String companyPhoneNo, String email, String position, String part, String managerMemo, String managerId) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("companyStaffSeq", companyStaffSeq);
		params.put("name", name);
		params.put("phoneNo", phoneNo);
		params.put("companyPhoneNo", companyPhoneNo);
		params.put("email", email);
		params.put("position", position);
		params.put("part", part);
		params.put("managerMemo", managerMemo);
		params.put("modifyYmdt", new Date());
		params.put("modifyManagerId", managerId);
		return sql.update(MAPPER_NAMESPACE + "updateCompanyStaff", params);
	}
	
	public int deleteCompanyStaff(int companyStaffSeq) {
		Map<String, Object> params = Maps.newHashMap();
		params.put("companyStaffSeq", companyStaffSeq);
		return sql.update(MAPPER_NAMESPACE + "deleteCompanyStaff", params);
	}
}