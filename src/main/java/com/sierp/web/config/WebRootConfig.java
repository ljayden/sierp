package com.sierp.web.config;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Configuration
@Import({
	PropertiesConfig.class, 
	PropertiesEnvConfig.class, 
	DatabaseConfig.class
	})
@ComponentScan(
		basePackages = {"com.sierp.web.component", "com.sierp.web.**.service"},
		includeFilters = @Filter(value = {Component.class, Service.class}), 
		useDefaultFilters = false
)
public class WebRootConfig implements InitializingBean {
	
	@Autowired ApplicationContext context;
	
	private static ApplicationContext staticContext;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		staticContext = context;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T getBean(Class<?> beanClz) {
		return (T) staticContext.getBean(beanClz);
	}
}