package com.sierp.web.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sierp.web.result.JsonResult;

public class LogUtils {
	 

    public static String format(String message) {
        return format(message, null, true).toString();
    }

    public static String format(String message, HttpServletRequest req) {
        return format(message, null, req, true).toString();
    }
    
    
    public static String format(String message, boolean includeHttpParamMap) {
        return format(message, null, includeHttpParamMap).toString();
    }
    
    public static String format(String message, JsonResult result, HttpServletRequest req) {
        return format(message, result, req, true, new String[0]).toString();
    }
    
    public static String format(String message, JsonResult result, boolean includeHttpParamMap) {
    	HttpServletRequest req = includeHttpParamMap ? RequestUtils.getRequest() : null;
        return format(message, result, req, includeHttpParamMap, new String[0]).toString();
    }
    
    /** 
     * @message 오류 내용. 로깅할 내용
     * 
       { 
                     에러 메세지=선물 정보 업데이트 실패,
                     요청정보={
                     refer=null, 
                     param={cardNo=[Q17VNBeWuRkvmLq],phoneNo=[xOeHjOehD9nuxd4=],idNo=[e555a180-d09f-11e5-b6b8-000000005d36]}, 
                     X-Forwarded-For=10.77.79.218, 
                     addr=10.24.108.110, 
                     uri=/popcard/app/membership/registPopTmoney, 
                     contentType=application/x-www-form-urlencoded; charset=UTF-8
                 }
                     응답정보={code=...message... result} 
       }
     * 
     */
    public static String format(String message, JsonResult result, HttpServletRequest req, boolean includeHttpParamMap, String... headerNames) {
    	
    	StringBuilder sb = new StringBuilder();
    	if (message != null) {
    		sb.append(message);
        }
    	try {
	        if (includeHttpParamMap) {
	        	if (sb.length() > 0) {
	        		sb.append(",");
	        	}
	        	
	        	if (req != null) {
	        		
            		Map<String, Object> requestMap = RequestUtils.toMap(req, headerNames);
 
	            	sb.append("요청정보=").append(requestMap);
	        	} else {
	        		sb.append("요청정보=No Http Servlet request!"); //전문 통신에서 발생
	        	}
	        } else {
	        	//????
	        }
    	} catch (Error err) {
    		//
    	}
        if (result != null) {
        	if (sb.length() > 0) {
        		sb.append(",");
        	}
        	sb.append("응답정보=").append(JacksonUtil.toJson(result));
        }
        return sb.toString();
    }
}
