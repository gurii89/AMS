package com.cafe24.guribyn.extra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class ExtraController {
	
	@Autowired
	CateService cateService;
	
	@Autowired
	ExtraService extraService;
	
	// 서비스 등록 폼
	@RequestMapping(value = "/extraAdd")
	public String extraAdd(Model model) {
		cateService.cateOptionSearch(model, "cate_large", "extra");
		return "extra/extraAdd";
	}
	
	// 서비스 등록 처리
	@RequestMapping(value = "/extraAdd", method = RequestMethod.POST)
	public String extraAddPro(Extra extra) {
		extraService.ExtraAddPro(extra);
		return "redirect:/extraList";
	}
	
	// 서비스 목록
	@RequestMapping(value = "/extraList")
	public String extraList(Model model) {
		extraService.ExtraList(model);
		return "extra/extraList";
	}
	
}
