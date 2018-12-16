package com.sierp.web.domain.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.project.model.Project;

@Repository
public class ProjectDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.business.project_dao.";
	
	public int insertProject(Project project) {
		return sql.insert(MAPPER_NAMESPACE + "insertProject", project);
	}
}
