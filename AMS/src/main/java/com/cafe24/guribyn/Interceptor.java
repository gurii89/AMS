package com.cafe24.guribyn;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession(false);
		System.out.println(session);
		if(session.getAttribute("loginfor") == null) {
			response.sendRedirect("./");
			return false;
		}else {
			return true;
		}		
	}	
}
