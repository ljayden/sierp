package com.sierp.web.domain.recruit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PostingConditionJoin extends PostingCondition {

	private String advantageName;
}
