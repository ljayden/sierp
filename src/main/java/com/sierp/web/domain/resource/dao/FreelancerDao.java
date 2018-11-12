package com.sierp.web.domain.resource.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.resource.model.Freelancer;

@Repository
public class FreelancerDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.resource.freelancer_dao.";
	
	public int insertFreelancer(Freelancer freelancer) {
		return sql.insert(MAPPER_NAMESPACE + "insertFreelancer", freelancer);
	}
}
