package com.sierp.web.config.support;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;


import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import lombok.Getter;
import lombok.Setter; 
import lombok.extern.slf4j.Slf4j;

import com.google.common.collect.Maps;
import com.sierp.web.util.EnumUtils;

/**
 *
 */
@Slf4j
public class SelectOptionsEnum extends SimpleTagSupport {
	
	@Getter @Setter private String enumClass;
	@Getter @Setter private String selectedValue;
	@Getter @Setter private String emptyValueName;
	@Getter @Setter private String optionNamePrefix;
	@Getter @Setter private String optionNameSuffix;
	
	
	private static Map<String, Class<?>> enumClassPathMap = Maps.newHashMap();
	
	static {
		try {
    		ResourcePatternResolver patternResolver = new PathMatchingResourcePatternResolver();
            Resource[] commResource = patternResolver.getResources("classpath*:com/sierp/**");
     
   	  		for (Resource resource : commResource) {
   	  			
   	  			String path = resource.getURI().toString();
   	  			if (path.endsWith(".class")) {
   	   	  			path = path.substring(path.lastIndexOf("com/sierp/"), path.length() - 6);
   	   	  			path = path.replaceAll("/", ".");
   	   	  			Class<?> clz = Class.forName(path);
   	   	  			if (clz.isEnum()) {
   	   	  				enumClassPathMap.put(clz.getSimpleName(), clz);
   	   	  				log.info("enum added .. =>> {} : {}", clz.getSimpleName(), path);
   	   	  			}
   	  			}
   	  		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
	}

    
	@SuppressWarnings("unchecked")
	@Override
	public void doTag() throws JspException, IOException {
		
		@SuppressWarnings({ "rawtypes"})
		Class<? extends Enum> clz = (Class<? extends Enum>) enumClassPathMap.get(enumClass);
		
		if (clz != null) {
			getJspContext().getOut().write(outputHtmlSelect(clz));
		} else {
			//로그 혹은 에러
		}
		
	}
	
	
	
	/*
	 * 셀렉트박스로 반환
	 */
	@SuppressWarnings("unchecked")
	private String outputHtmlSelect(@SuppressWarnings("rawtypes") Class<? extends Enum> clz) {
		

		
		StringBuffer outputHtml = new StringBuffer();

		if (StringUtils.isNotEmpty(emptyValueName)) {
			outputHtml.append("<option value=\"\" ");
			if (StringUtils.isEmpty(selectedValue)) {
				outputHtml.append("selected");
			}
			
			outputHtml.append(">").append(emptyValueName).append("</option>");
		} else {
			
		}


		for (Object targetEnum : org.apache.commons.lang3.EnumUtils.getEnumList(clz)) {
			
			outputHtml.append("<option value='" + targetEnum.toString() + "' ");
			if (targetEnum.toString().equals(selectedValue)) {
				outputHtml.append("selected");
			}
			outputHtml.append(">");
			if (StringUtils.isNotEmpty(optionNamePrefix)) {
				outputHtml.append(optionNamePrefix);
			}
			outputHtml.append(EnumUtils.getDescriptionByName(clz, targetEnum.toString()));
			if (StringUtils.isNotEmpty(optionNameSuffix)) {
				outputHtml.append(optionNameSuffix);
			}
			outputHtml.append("</option>");
		}
 
		return outputHtml.toString();
	}
}
