package com.sierp.web.component;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sierp.web.domain.common.service.LoginService;

@Component
@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

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
			if (!request.getRequestURI().contains("/login.do")) {
				response.sendRedirect("/login.do");
		        return false;
			}
		}
		
		return true;
	}
 
}
