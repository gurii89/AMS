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
	
	// 카테고리 등록화면
	@RequestMapping(value = "/employeeAdd")
	public String cateAdd(Model model) {
		model.addAttribute("list", cateService.cateList());
		return "employeeAdd";
	}
}
