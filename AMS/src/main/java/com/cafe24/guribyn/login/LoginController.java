package com.cafe24.guribyn.login;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.guribyn.login.EmployeeTest;

@Controller
public class LoginController{
	
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private LoginService loginService;
	
	//로그인 폼 요청
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String loginform(HttpSession session) {
		System.out.println("로그인폼 요청---------login.jsp");
		if(session.getAttribute("loginemployee") == null) {
		return "login";
		}else {
		return "redirect:/cateAdd";
		}
	}
	//로그인 처리
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPro(EmployeeTest employeetest, HttpSession session) {
		EmployeeTest loginemployee = loginDao.login(employeetest);
		System.out.println("로그인정보--------->" + loginemployee);
		if(loginemployee == null) {
			System.out.println("로그인실패");	
			return "redirect:/";
		}else {
			System.out.println("로그인완료");
			
			//로그인이력저장
			loginService.logHistory(loginemployee);
			System.out.println("로그인이력 저장");
			
			//로그인 세션 정보 세팅
			session.setAttribute("loginemployee", loginemployee);
			return "home";	
		}
	}
	@RequestMapping(value="/logout", method = RequestMethod.POST)	
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}


