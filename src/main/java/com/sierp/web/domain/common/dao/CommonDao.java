package com.sierp.web.domain.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Maps;
import com.sierp.web.domain.common.constant.AdvantageType;
import com.sierp.web.domain.common.constant.SkillSetType;
import com.sierp.web.domain.common.model.Advantage;

@Repository
public class CommonDao {

	@Autowired SqlSessionTemplate sql;

	static final String MAPPER_NAMESPACE = "mapper.common.common_dao.";
	
	public List<Advantage> selectAdvantageList(String customerCode, AdvantageType advantageType, SkillSetType skillSetType, boolean includeCommon) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("customerCode", customerCode);
		param.put("advantageType", advantageType);
		param.put("skillSetType", skillSetType);
		param.put("includeCommon", includeCommon);
		return sql.selectList(MAPPER_NAMESPACE + "selectAdvantageList", param);
	}
}
