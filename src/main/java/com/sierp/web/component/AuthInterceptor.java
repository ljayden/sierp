package com.sierp.web.component;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sierp.web.domain.common.service.LoginService;
import com.sierp.web.domain.company.model.CustomerManager;
import com.sierp.web.result.JsonResults;
import com.sierp.web.util.JacksonUtil;

@Component
@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter implements HandlerMethodArgumentResolver {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute(LoginService.SESSION_CUSTOM_ATTR_FIELD);
		
		log.debug("로그인 체크 요청 url ={}, 세션 객체 ={}", request.getRequestURI(), obj);
		if (obj != null) {
			//로그인 되어 있다면
			
			if (request.getRequestURI().contains("/login.do") || request.getRequestURI().equals("/")) {
	        	response.sendRedirect("/home/dashboard/main.do");
	        	return false;
			}
			
		} else {
			//로그인 안되어 있다면
			if (request.getRequestURI().endsWith("json")) {
				
				response.getWriter().write(JacksonUtil.toJson(JsonResults.fail(9000, "로그아웃 되었습니다.")));
				return false;
			} else {
				if (!request.getRequestURI().contains("/login.do")) {
					response.sendRedirect("/login.do");
			        return false;
				}
			}

		}
		return true;
	}
 
	
    @Override
	public boolean supportsParameter(MethodParameter parameter) {
    	
    	Class<?> clz = parameter.getParameterType();
    	if (clz != null && clz == CustomerManager.class) {
    		return true;
    	}
    	
    	return false;
    }
 
    @Override
    public Object resolveArgument(MethodParameter parameter,
                       ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			           WebDataBinderFactory binderFactory) throws Exception {

        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        
		return request.getSession().getAttribute(LoginService.SESSION_MANAGER_ATTR_FIELD);
	}
}
