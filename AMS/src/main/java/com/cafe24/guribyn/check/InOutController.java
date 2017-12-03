package com.cafe24.guribyn.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InOutController {

	@Autowired
	InOutService inOutService;
	
	// 입퇴실 목록
	@RequestMapping("inOutList")
	public String bookingList(Model model
			, @RequestParam(value = "cate", required=false) String cate 
			, @RequestParam(value = "input", required=false) String input
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		inOutService.inOutList(model, currentPage, cate, input);
		return "check/inOutList";
	}
	
}
