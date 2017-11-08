package com.cafe24.guribyn.cate;

import java.util.List;

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
	CateDao cateDao;
	
	// 카테고리 등록화면
	@RequestMapping(value = "/cateAdd")
	public String cateAdd(Model model) {
		model.addAttribute("list", cateDao.cateAddList());
		return "cateAdd2";
	}
	
	// 카테고리명 중복확인
	@ResponseBody
	@RequestMapping(value = "/cateNameCheck")
	public String cateNameCheck(@RequestParam ("name") String name) {
		return cateDao.cateNameCheck(name);
	}
	
	// 대분류 선택시 소분류 출력
	@ResponseBody
	@RequestMapping(value = "/cateSmall")
	public String cateSmall(@RequestParam ("large") String large) {
		return cateDao.cateSmall(large);
	}
	
	// 카테고리 등록처리
	@RequestMapping(value = "/cateAdd", method = RequestMethod.POST)
	public String cateAdd(Cate cate) {
		cateDao.cateAdd(cate);
		return "redirect:/cateAdd";
	}
}
