package com.cafe24.guribyn.extra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		extraService.extraAddPro(extra);
		return "redirect:/extraList";
	}
	
	// 서비스 목록
	@RequestMapping(value = "/extraList")
	public String extraList(Model model) {
		extraService.extraList(model);
		return "extra/extraList";
	}
	
	// 이용 서비스 임시 등록(세션에 보관)
	@ResponseBody
	@RequestMapping(value = "bookingExtra")
	public String bookingExtra(@RequestParam ("cateCode") String cateCode, @RequestParam ("extraCode") String extraCode,
							@RequestParam ("extraDate") String extraDate, @RequestParam ("extraRate") String extraRate,
							@RequestParam ("extraName") String extraName) {
		return extraService.bookingExtra(cateCode, extraCode, extraDate, extraRate, extraName);
	}
	
	// 서비스 분류에 맞는 서비스 목록
	@ResponseBody
	@RequestMapping(value = "extraName")
	public String extraName(@RequestParam ("cateCode") String cateCode) {
		return extraService.extraName(cateCode);
	}
	
}
