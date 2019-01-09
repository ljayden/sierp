package com.sierp.web.controller.recruit.request;

import com.sierp.web.result.Pager;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PostingSearchRequest extends Pager {

	private Integer companySeq;
}
