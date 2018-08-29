package com.sierp.web.config;

import java.io.IOException;
import java.util.Properties;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.util.StringUtils;

@Configuration
@Slf4j
//@PropertySource("classpath:properties/api.properties")
//@PropertySource("classpath:properties/jdbc.properties")
public class PropertiesEnvConfig implements InitializingBean {

	@Autowired private ConfigurableEnvironment env;

	public void afterPropertiesSet() throws Exception {
		initCommonProperty();
	 	log.info("initialize PropertySource to Environment");
	}

	
	
	/**
	 * Property Environment에 주입
	 */
	private void initCommonProperty() throws IOException {
		
	    MutablePropertySources mpss = env.getPropertySources();
	 	for (Resource resource : PropertiesConfig.getProjectResources()) {
		    Properties properties = PropertiesLoaderUtils.loadProperties(resource);
		    mpss.addFirst(new PropertiesPropertySource(getNameForResource(resource), properties));
	 	}
	}

	
	private static String getNameForResource(Resource resource) {
		String name = resource.getFilename();
		if (!StringUtils.hasText(name)) {
			name = resource.getClass().getSimpleName() + "@" + System.identityHashCode(resource);
		}
		return name;
	}
}
