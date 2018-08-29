package com.sierp.web.config;

import java.io.IOException;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

/**
 */
@Configuration
@Slf4j
public class PropertiesConfig {

	public static final String PROJECT_PROPERTY_PATH = "classpath*:properties/**/*";
	

	@Bean
	public static PropertyPlaceholderConfigurer propertyPlaceholderConfigurer() throws IOException {
		PropertyPlaceholderConfigurer propertyConfigurer = new PropertyPlaceholderConfigurer();
		propertyConfigurer.setLocations(getProjectResources());
		log.info("PropertyPlaceholderConfigurer !!! Loading");
		return propertyConfigurer;
	}
	
	
	public static Resource[] getProjectResources() throws IOException {
        ResourcePatternResolver patternResolver = new PathMatchingResourcePatternResolver();
        Resource[] commResource = patternResolver.getResources(PROJECT_PROPERTY_PATH);
        for (Resource res : commResource) {
    		log.info("getProjectResources !!! {}", res.getURI());	
        }

        return commResource;
	}
}
