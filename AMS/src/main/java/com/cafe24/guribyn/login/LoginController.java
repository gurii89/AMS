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
	
	//�α����� ��û
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String loginform(HttpSession session) {
		System.out.println("������ ��û --- �α����� --- login.jsp");
		if(session.getAttribute("loginemployee") == null) {
		return "login";
		}else {
		return "redirect:/cateAdd";
		}
	}
	//�α��� ó��
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPro(EmployeeTest employeetest, HttpSession session) {
		EmployeeTest loginemployee = loginDao.login(employeetest);
		System.out.println("��û --- �α���ó�� --- loginemployee --------> " + loginemployee);
		if(loginemployee == null) {
			System.out.println("����");	
			return "redirect:/";
		}else {
			System.out.println("�α��μ���");
			session.setAttribute("loginemployee", loginemployee);
			
			//�α��� �̷� ����
			loginService.logHistory(loginemployee);
			System.out.println("�α����̷�����Ϸ�");
			return "redirect:/cateAdd";	
		}
	}

	
}
