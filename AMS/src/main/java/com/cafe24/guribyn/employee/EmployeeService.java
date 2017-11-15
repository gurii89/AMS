package com.cafe24.guribyn.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDao employeeDao;
	
	// 직원 등록 처리
	public void employeeAddPro(Employee employee) {
		if(employee.geteLanguage().equals("")) {
			employee.seteLanguage(null);
		}
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
}
