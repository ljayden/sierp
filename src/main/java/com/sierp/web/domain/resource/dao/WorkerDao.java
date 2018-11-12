package com.sierp.web.domain.resource.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.resource.model.Worker;
import com.sierp.web.domain.resource.model.WorkerAdvantage;
import com.sierp.web.domain.resource.model.WorkerCareer;

@Repository
public class WorkerDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.resource.worker_dao.";
	
	public int insertWorker(Worker worker) {
		return sql.insert(MAPPER_NAMESPACE + "insertWorker", worker);
	}
	
	public int insertWorkerCareer(WorkerCareer workerCareer) {
		return sql.insert(MAPPER_NAMESPACE + "insertWorkerCareer", workerCareer);
	}
	
	public int insertWorkerAdvantage(WorkerAdvantage workerAdvantage) {
		return sql.insert(MAPPER_NAMESPACE + "insertWorkerAdvantage", workerAdvantage);
	}
}
