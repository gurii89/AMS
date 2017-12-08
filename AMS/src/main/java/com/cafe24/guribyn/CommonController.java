package com.cafe24.guribyn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	//소개 페이지
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
}
