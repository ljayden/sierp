package com.sierp.web.result.exception;

import com.sierp.web.result.exception.define.HasCode;

@SuppressWarnings("serial")
public class InvalidAccessException extends RuntimeException implements HasCode {

	@Override
	public int getCode() {
		return 400;
	}
}
