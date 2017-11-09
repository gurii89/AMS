package com.cafe24.guribyn.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class EmployeeController {
	@Autowired
	CateService cateService;
	
	// 직원 등록시 카테고리 확인
	@RequestMapping(value = "/employeeAdd")
	public String employeeCate(Model model) {
		cateService.cateList(model, 0);
		return "employeeAdd";
	}
}
