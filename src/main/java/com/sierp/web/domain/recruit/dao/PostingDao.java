package com.sierp.web.domain.recruit.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sierp.web.domain.recruit.model.Posting;
import com.sierp.web.domain.recruit.model.PostingCondition;

@Repository
public class PostingDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.recruit.posting_dao.";
	
	public int insertPosting(Posting posting) {
		return sql.insert(MAPPER_NAMESPACE + "insertPosting", posting);
	}
	
	public int insertPostingCondition(PostingCondition postingCondition) {
		return sql.insert(MAPPER_NAMESPACE + "insertPostingCondition", postingCondition);
	}
}
