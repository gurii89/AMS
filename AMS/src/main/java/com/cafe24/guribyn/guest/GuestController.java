package com.cafe24.guribyn.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class GuestController {
	
	@Autowired
	CateService cateService;
	
	@Autowired
	GuestService guestService;
	
	// 고객 등록 폼
	@RequestMapping(value = "/guestAdd")
	public String guestAdd(Model model) {
		cateService.cateNation(model);
		return "guest/guestAdd";
	}
	
	// 고객 등록 처리
	@RequestMapping(value = "/guestAdd", method = RequestMethod.POST)
	public String guestAddPro(Guest guest) {
		guestService.guestAddPro(guest);
		return "redirect:/guestList";
	}
	
	// 고객 목록
	@RequestMapping(value = "/guestList")
	public String guestList(Model model
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
			guestService.guestList(model, currentPage);
		return "guest/guestList";
	}
}
