package com.sierp.web.domain.company.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.sierp.web.domain.company.model.Customer;
import com.sierp.web.domain.company.model.CustomerManager;

@Repository
public class CustomerDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.company.customer_dao.";
	
	public List<Customer> selectCustomer() {
		Map<String, Object> param = Maps.newHashMap();
		return sql.selectList(MAPPER_NAMESPACE + "selectCustomer", param);
	}
	
	public Customer selectCustomerByCode(String code) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("customerCode", code);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCustomerByCode", param);
	}
	
	
	public CustomerManager selectCustomerManagerByIdPassword(int customerSeq, String id, String password) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("customerSeq", customerSeq);
		param.put("id", id);
		param.put("password", password);
		return sql.selectOne(MAPPER_NAMESPACE + "selectCustomerManagerByIdPassword", param);
	}
	
	public List<CustomerManager> selectCustomerManagerList(int customerSeq) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("customerSeq", customerSeq);
		return sql.selectList(MAPPER_NAMESPACE + "selectCustomerManagerList", param);
	}
}
