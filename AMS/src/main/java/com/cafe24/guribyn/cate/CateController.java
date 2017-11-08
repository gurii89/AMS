package com.cafe24.guribyn.cate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CateController {	
	@Autowired
	CateService cateService;
	
	@Autowired
	HttpSession session;
	
	// 카테고리 등록화면
	@RequestMapping(value = "/cateAdd")
	public String cateAdd(Model model) {
		if(sessionCheck()) {
			model.addAttribute("list", cateService.cateLarge());
			return "cateAdd";
		}else {
			return "login";
		}
	}
	
	// 대분류 선택시 소분류 출력
	@ResponseBody
	@RequestMapping(value = "/cateSmall")
	public String cateSmall(@RequestParam ("large") String large) {
		return cateService.cateSmall(large);
	}
	
	// 카테고리명 중복확인
	@ResponseBody
	@RequestMapping(value = "/cateNameCheck")
	public String cateNameCheck(@RequestParam ("name") String name, @RequestParam ("small") String small) {
		return cateService.cateNameCheck(name, small);
	}
	
	// 카테고리 등록처리
	@RequestMapping(value = "/cateAdd", method = RequestMethod.POST)
	public String cateAdd(Cate cate) {
		if(sessionCheck()) {
			cateService.cateAdd(cate);
			return "redirect:/cateAdd";
		}else {
			return "login";
		}
	}
	
	// 로그인 확인
	private boolean sessionCheck() {
		if(session.getAttribute("loginemployee") != null) {
			return true;
		}else {
			return false;
		}
	}
}
