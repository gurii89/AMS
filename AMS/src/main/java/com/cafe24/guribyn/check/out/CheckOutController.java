package com.cafe24.guribyn.check.out;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CheckOutController {

	@Autowired
	CheckOutService checkOutService;
	
	// 체크인 등록 처리
	@RequestMapping(value = "checkOutAdd")
	public String checkOutAddPro(Model model, @RequestParam("booCode") int booCode) {
		checkOutService.checkOutAddPro(booCode);
		model.addAttribute("booCode", booCode);
		return "redirect:/bookingDetail";
	}
	
}
