package com.sierp.web.result.exception.define;

import static javax.servlet.http.HttpServletResponse.*;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;


public class ExceptionDefinitions {
	
	private static Map<Class<? extends Exception>, ExceptionDefinition> errors = new HashMap<>();

	
	private final static ExceptionDefinition DEFAULT_ERROR = new ExceptionDefinition(Exception.class, SC_INTERNAL_SERVER_ERROR, 500, "Unknown Server Error", true);
	
	public void addExceptionDefinition(Class<? extends Exception> exceptionClz, int statusCode, int code, String message, boolean logging) {
		errors.put(exceptionClz, new ExceptionDefinition(exceptionClz, statusCode, code, message, logging));
		
	}

	
	public static ExceptionDefinition getExceptionDefinition(Exception ex) {

		return errors.getOrDefault(ex.getClass(), DEFAULT_ERROR);
	}

	public static Collection<ExceptionDefinition> getDefineList() {
		return errors.values();
	}
	
	public static boolean isDefined(Exception exception) {
		return errors.containsKey(exception);
	}
}
