package com.cafe24.guribyn.employee;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.login.Login;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	HttpSession session;
	
	// 직원 등록 처리
	public void employeeAddPro(Employee employee) {
		if(employee.geteLanguage().equals("")) {
			employee.seteLanguage(null);
		}
		Login result = (Login)session.getAttribute("loginfor");
		employee.setmId(result.geteId());
		employeeDao.employeeAddPro(employee);
	}
	
	// 직원 수정 폼
	public void employeeOne(Model model, String eId) {
		model.addAttribute("employee", employeeDao.employeeOne(eId));
	}
	
	// 직원 수정 처리
	public void employeeMod(Employee employee) {
		if(employee.geteLanguage().equals("")) {
			employee.seteLanguage(null);
		}
		employeeDao.employeeMod(employee);
	}
	
	// 직원 목록
	public void employeeList(Model model) {
		model.addAttribute("employeeList", employeeDao.employeeList());
		session.setAttribute("top", "employee");
	}
	
}
