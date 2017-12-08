package com.cafe24.guribyn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@Autowired
	CommonService commonService;

	// 소개 페이지
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	// 로그인 후 메인
	@RequestMapping(value="/home")	
	public String home() {
		String level = commonService.HomeSesseion();
		if(level.equals("manager")) {
			return "home";
		}else if(level.equals("front")) {
			return "redirect:/frontMain";
		}else if(level.equals("clean")) {
			return "redirect:/cleanMain";
		}else {
			return "redirect:/login";
		}
	}
	
}
