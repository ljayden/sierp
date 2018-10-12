package com.sierp.web.component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
@Slf4j
public class GlobalInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		
		setMenuPath(request);

		log.debug("Top menu path={}, Sub menu Path={}", request.getAttribute("topMenuPath"), request.getAttribute("subMenuPath"));
		return true;
	}
	
	private void setMenuPath(HttpServletRequest request) {

		String uri = request.getRequestURI();
		if (uri.startsWith("/")) {
			uri = uri.substring(1);
		}
		
		String[] paths = uri.split("/", 3);
		if (paths.length == 1) {
			request.setAttribute("topMenuPath", "");
			request.setAttribute("subMenuPath", "");
			
		} else if (paths.length == 2) {
			request.setAttribute("topMenuPath", paths[0]);
			request.setAttribute("subMenuPath", "");
			
		} else { // 3보다 큰거
			request.setAttribute("topMenuPath", paths[0]);
			request.setAttribute("subMenuPath", paths[1]);
		}
	}
}
