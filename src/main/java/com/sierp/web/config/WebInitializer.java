package com.sierp.web.config;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;
import com.sierp.web.config.support.ReloadWritableHttpServletRequestWrapperFilter;


@Slf4j
public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
	
		return new Class[]{WebRootConfig.class};
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[]{WebServletConfig.class};
	}
	
	@Override
	protected String[] getServletMappings() {
		return new String[]{"*.do", "*.json"};
	}
	
	
	@Override
	final public void onStartup(ServletContext servletContext) throws ServletException {
        log.info("server on Startup, {}", servletContext.getServletContextName());
         
    	FilterRegistration.Dynamic frdHttpMethod = servletContext.addFilter("reloadRequestFilter", ReloadWritableHttpServletRequestWrapperFilter.class); 
    	frdHttpMethod.addMappingForUrlPatterns(null, true, "/*");
    	
		FilterRegistration.Dynamic frdMesh	= servletContext.addFilter("sitemesh", SiteMeshFilter.class);
		frdMesh.setInitParameter("pageEncoding", "UTF-8");
		frdMesh.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD, DispatcherType.ERROR), true, "/*");
		
    	FilterRegistration.Dynamic frdEncoding = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
    	frdEncoding.setInitParameter("encoding", "UTF-8");
    	frdEncoding.addMappingForUrlPatterns(null, true, "/*");
     
    	servletContext.getSessionCookieConfig().setHttpOnly(true);
    	
		super.onStartup(servletContext);
	}
}
