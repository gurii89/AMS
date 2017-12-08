package com.cafe24.guribyn;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loginfor") != null) {
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			session.setAttribute("today", dateFormat.format(calendar.getTime()));
			return true;
		}else {
			response.sendRedirect("login");
			return false;
		}		
	}	
}
