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
	private LoginDao loginDao;
	
	@Autowired
	private LoginService loginService;
	
	//로그인 폼 요청
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String loginform(HttpSession session) {
		System.out.println("---로그인폼 요청---------login.jsp");
		if(session.getAttribute("loginemployee") == null) {
		return "login";
		}else {
		return "redirect:/cateAdd";
		}
	}
	//로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPro(Login login, HttpSession session) {
		Login loginfor = loginDao.login(login);
		System.out.println("---로그인정보--------->" + loginfor);
		if(loginfor == null) {
			System.out.println("---로그인실패");	
			return "redirect:/";
		}else {
			System.out.println("---로그인완료");
			//인아웃체크
			Login loginforcheck = loginDao.inCheck(loginfor);
			//로그인이력저장
			loginService.logHistory(loginforcheck);
			System.out.println("---로그인이력 저장");
			
			//로그인 세션 정보 세팅
			session.setAttribute("loginfor", loginfor);
			return "home";	
		}
	}
	//로그아웃 처리
	@RequestMapping(value="/logout", method = RequestMethod.POST)	
	public String logout(HttpSession session) {
		//인아웃체크
		Login loginfor = (Login) session.getAttribute("loginfor");
		Login loginforcheck = loginDao.outCheck(loginfor);
		
		session.invalidate();
		System.out.println("---로그아웃 성공");
		
		//로그아웃 이력 저장
		loginService.logHistory(loginforcheck);
		System.out.println("---로그아웃이력 저장");
		
		return "redirect:/";
	}
}


