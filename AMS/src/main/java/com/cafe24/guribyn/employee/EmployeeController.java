package com.cafe24.guribyn.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class EmployeeController {
	@Autowired
	CateService cateService;
	
	@Autowired
	EmployeeService employeeService;
	
	// 직원 등록 폼 + 카테고리 확인
	@RequestMapping(value = "/employeeAdd")
	public String employeeCate(Model model) {
		cateService.cateOption(model);
		return "employee/employeeAdd";
	}
	
	// 직원 등록 처리
	@RequestMapping(value = "/employeeAdd", method = RequestMethod.POST)
	public String employee(Employee employee) {
		employeeService.employeeAddPro(employee);
		return "redirect:/employeeList";
	}
	
	// 직원 수정 폼
	@RequestMapping(value = "/employeeMod")
	public String employeeMod(Model model, @RequestParam ("eId") String eId) {
		cateService.cateOption(model);
		employeeService.employeeOne(model, eId);
		return "employee/employeeMod";
	}
	
	// 직원 수정 처리
	@RequestMapping(value = "/employeeMod", method = RequestMethod.POST)
	public String employeeMod(Employee employee) {
		employeeService.employeeMod(employee);
		return "redirect:/employeeList";
	}
	
	// 직원 목록
	@RequestMapping(value = "/employeeList")
	public String employeeList(Model model) {
		employeeService.employeeList(model);
		return "employee/employeeList";
	}
	
}
