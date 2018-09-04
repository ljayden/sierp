package com.sierp.web.util;


import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.common.collect.Maps;
import com.sierp.web.config.support.ReloadWritableHttpServletRequestWrapperFilter;
import com.sierp.web.domain.constants.AppOsType;


@Slf4j
public class RequestUtils {
	
	public static Object getAttribute(String name) {
		HttpServletRequest request = getRequest();
		if (!Objects.isNull(request)) {
			return request.getAttribute(name);
		}
		return null;
	}
	
	public static HttpServletRequest getRequest() {
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (sra == null) {
            return null;
        }
        return sra.getRequest();
	}
	
	/**
	 * Cant get Request in RequestContextHolder throw NullPointerException
	 * @return
	 */
    public static Map<String, Object> toMap(String... headerNames) {
        return toMap(null, headerNames);
    }
    
	public static Map<String, Object> toMap(HttpServletRequest request, String... headerNames) {
        if (request == null) {
        	request = getRequest();
        }
        if (request == null) {
            throw new NullPointerException("Request is null or Can't found HttpRequest at RequestContextHolder");
        }
        
        Map<String, Object> map = Maps.newHashMap();
        
        map.put("addr", request.getRemoteAddr());
        map.put("uri", request.getRequestURI());
        map.put("method", request.getMethod());
        
        map.put("content-type", request.getContentType());
        map.put("referer", request.getHeader("Referer"));
        String existingHeader = request.getHeader("X-Forwarded-For"); //API - GW 통해서 들어올 경우, api-gw IP만 찍혀서 호출지 IP 찍기 위해 추가
        if (!StringUtils.isEmpty(existingHeader)) {
            map.put("X-Forwarded-For", existingHeader);
        }
        
        Enumeration<String> enu = request.getHeaderNames();
        Map<String, String> headerMap = Maps.newHashMap();
        while (enu.hasMoreElements()) {
        	String name = enu.nextElement();
        	if (name.equalsIgnoreCase("accept") || name.equalsIgnoreCase("connection") || name.equalsIgnoreCase("accept-encoding") || name.equalsIgnoreCase("content-length")
        	 || name.equalsIgnoreCase("X-Requested-With") || name.equalsIgnoreCase("JSESSIONID") || name.equalsIgnoreCase("BID") 
        	 || name.equalsIgnoreCase("charset") || name.equalsIgnoreCase("cookie") || name.equalsIgnoreCase("userLocale") || name.equalsIgnoreCase("ipCheckYn")
        	 || name.equalsIgnoreCase("cache-control") || name.equalsIgnoreCase("origin") || name.equalsIgnoreCase("host") || name.equalsIgnoreCase("accept-language")
        	 || name.equalsIgnoreCase("Referer")  || name.equalsIgnoreCase("X-Forwarded-For")  || name.equalsIgnoreCase("content-type")
        			
        	) {
        		
        		continue;
        	}
        	String value = request.getHeader(name);
        	headerMap.put(name, value);
        }
        map.put("header", headerMap.toString());
        
        Map<String, Object> parameter = getParameterMap(request);
        if (parameter.size() > 0) {
            map.put("parameter", parameter);
        }
        
        if (isApplicationJson(request)) {
        	try {
                map.put("json-body", getStringFromInputSteam(request)); 	
        	} catch (Exception e) {
        		 map.put("json-body", "can't read reqeust body"); 	
        	}
        }
        
        for (String headerName : headerNames) {
        	String headerValue = request.getHeader(headerName);
        	if (!StringUtils.isEmpty(headerValue)) {
        		map.put("header-" + headerName, headerValue);
        	}
        }
        return map;
	}

	
	/**
	 * 삭제 보류
	 */
    protected static Object getRequestParameter(HttpServletRequest request, boolean forceCheckContentType) {

        if (isApplicationJson(request)) {

        	String jsonStr = "";
            try {
                jsonStr = getStringFromInputSteam(request);
                Map<String, Object> map = JacksonUtil.toMap(jsonStr);
                return map;
            } catch (Exception e) {
            	/* Map으로 변환이 안되는 상황에서는 그냥 string으로 리턴*/
    			return jsonStr;
    		}
        } else if (isApplicationWwwForm(request) || StringUtils.equalsIgnoreCase(request.getMethod(), "GET")) {
        	return getParameterMap(request);
        	
        } else {
        	if (forceCheckContentType) {
        		throw new HttpMessageNotReadableException("can't read request body invalid conent-type, content-type=" + request.getContentType());
        	} else {
        		return "can't read request body, content-type=" + request.getContentType();
        	}
        }
    }
    

    public static String getStringFromInputSteam(HttpServletRequest request) {
    	
        String val = (String) request.getAttribute(ReloadWritableHttpServletRequestWrapperFilter.IS_RELOAD_WRAPPER_FILTER);
        if (!"TRUE".equals(val)) {
            log.warn("Content-type json - ReloadHttpRequestWrapperFilter 적용 필요");
            return "";
        }
        
        try {
            byte[] tmp = FileCopyUtils.copyToByteArray(request.getInputStream());
            return new String(tmp, getEncodingSetFromRequest(request));
            
        } catch (IOException ioe) {
            throw new HttpMessageNotReadableException("can't read request body", ioe);
        }
    }
    
    private static Map<String, Object> getParameterMap(HttpServletRequest request) {
    	Map<String, Object> paramMap = Maps.newHashMap();
        for (Entry<String, String[]> param :  request.getParameterMap().entrySet()) {
            
            String paramValue = Arrays.toString(param.getValue());
            paramValue = paramValue.substring(1, paramValue.length() - 1); //[ ] 제거
            paramMap.put(param.getKey(), paramValue);
        }
        
        return paramMap;
    }
    
    
    public static String getEncodingSetFromRequest(HttpServletRequest request) {
    	String conentType = request.getContentType();
    	String encodingSet = StringUtils.containsIgnoreCase(conentType, "euc-kr") ? "euc-kr" : "UTF-8";
        return encodingSet;
    }
    
    public static boolean isApplicationJson(HttpServletRequest request) {
        String conentType = request.getContentType();
        return (conentType != null && StringUtils.containsIgnoreCase(conentType, "json"));
    }
    
    public static boolean isApplicationWwwForm(HttpServletRequest request) {
        String conentType = request.getContentType();
        return (conentType != null && StringUtils.containsIgnoreCase(conentType, "www-form"));
    }
    
    public static boolean isMultipartFormData(HttpServletRequest request) {
        String conentType = request.getContentType();
        return (conentType != null && StringUtils.containsIgnoreCase(conentType, "multipart"));
    }
    
    /**
     * @return String IOS or AOS 
     */
    public static AppOsType getOSInfo(String userAgent) {
        userAgent = userAgent.toLowerCase();
        if (StringUtils.indexOfIgnoreCase(userAgent, "iphone") > -1 || StringUtils.indexOfIgnoreCase(userAgent, "ipad") > -1 || StringUtils.indexOfIgnoreCase(userAgent, "ipod") > -1) {
            return AppOsType.IOS;
        } else if (StringUtils.indexOfIgnoreCase(userAgent, "android") > -1) {
        	 return AppOsType.AOS;
        } else {
            log.debug("os 정보 확인 필요 userAgent={}", userAgent);
            return null;
        }
    }
   

}
