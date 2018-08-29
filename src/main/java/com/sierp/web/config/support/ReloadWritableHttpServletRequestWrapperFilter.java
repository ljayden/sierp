package com.sierp.web.config.support;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.sierp.web.util.RequestUtils;


public class ReloadWritableHttpServletRequestWrapperFilter implements Filter {
    
	public final static String IS_RELOAD_WRAPPER_FILTER = "IS_RELOAD_WRAPPER_FILTER";
	public final static String REQ_SERVER_FILTER_REACH_TIME = "REQ_SERVER_FILTER_REACH_TIME";
	
	boolean conditional = true;
	
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        
        request.setAttribute(REQ_SERVER_FILTER_REACH_TIME, System.currentTimeMillis());
        
        if (conditional && (!RequestUtils.isApplicationJson(httpServletRequest) && !RequestUtils.isApplicationWwwForm(httpServletRequest))) {
            
        	chain.doFilter(request, response);
        
        } else {
        	httpServletRequest.setAttribute(IS_RELOAD_WRAPPER_FILTER, "TRUE");
            
        	ReloadWritableHttpServletRequestWrapper requestWrapper = new ReloadWritableHttpServletRequestWrapper(httpServletRequest);
            chain.doFilter(requestWrapper, response);
        }
    }
    

    public void init(FilterConfig filterConfig) throws ServletException {
    	
    	String conditionalApply = filterConfig.getInitParameter("conditionalApply");
    	if (StringUtils.isNotEmpty(conditionalApply)) { 
    		if (StringUtils.equalsIgnoreCase("false", conditionalApply)) {
    			conditional = false;
    		}
    	}    	
    }
    
    public void destroy() {
        
    }
}