package com.cafe24.guribyn.cate;

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
	
	// 카테고리 검색
	@RequestMapping(value = "/cateSearch", method = RequestMethod.POST)
	public String cateSearch(Model model
				, @RequestParam("cate") String cate
				, @RequestParam("input") String input
				, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		cateService.cateSearch(model, cate, input, currentPage);
		return "cate/cateList";
	}
	
	// 카테고리 목록
	@RequestMapping(value = "/cateList")
	public String cateList(Model model
				, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		cateService.cateList(model, currentPage);
		return "cate/cateList";
	}
	
	// 카테고리 등록화면
	@RequestMapping(value = "/cateAdd")
	public String cateAdd(Model model) {
		model.addAttribute("cateList", cateService.cateLarge());
		return "cate/cateAdd";
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
	public String cateAddPro(Cate cate) {
		cateService.cateAddPro(cate);
		return "redirect:/cateList";
	}
}