package com.cafe24.guribyn.login;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.guribyn.login.Login;

@Controller
public class LoginController{
	
	@Autowired
	private LoginService loginService;
	
	//로그인 폼 요청
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String loginform(HttpSession session) {
		System.out.println("---로그인요청---------from controller");
		if(session.getAttribute("loginfor") == null) {
			return "login";
		}else {
			return "home";
		}
	}
	//로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPro(Login login, HttpSession session) {
		return loginService.login(login, session);
	}
	//로그아웃 처리
	@RequestMapping(value="/logout", method = RequestMethod.POST)	
	public String logoutPro(HttpSession session) {
		return loginService.logout(session);
	}
}


