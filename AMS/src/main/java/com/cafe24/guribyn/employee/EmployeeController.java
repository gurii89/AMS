package com.cafe24.guribyn.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class EmployeeController {
	@Autowired
	CateService cateService;
	
	@Autowired
	EmployeeService employeeService;
	
	// 직원 등록시 카테고리 확인
	@RequestMapping(value = "/employeeAdd")
	public String employeeCate(Model model) {
		cateService.cateList(model, 0);
		return "employee/employeeAdd";
	}
	
	// 직원 등록 처리
	@RequestMapping(value = "/employeeAdd", method = RequestMethod.POST)
	public String employee(Employee employee) {
		employeeService.employeeAdd(employee);
		return "redirect:/employee/employeeAdd";
	}
}
