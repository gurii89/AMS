package com.cafe24.guribyn.keep;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class KeepController {
	
	@Autowired
	private CateService cateService;
	
	@Autowired
	private KeepService keepService;
	
	//보관품 등록 폼 + 보관품 카테고리 확인
	@RequestMapping(value = "/keepAdd")
	public String keepAddCate(Model model) {
		System.out.println("KeepController 보관품 등록폼+카테고리");
		cateService.cateOptionSearch(model, "cate_small", "keep");
		return "keep/keepAdd";
	}
		
	//보관품 등록 처리
	@RequestMapping(value="/keepAdd", method = RequestMethod.POST)
	public String keepAddPro(Keep keep) {
		System.out.println("KeepController 보관품 등록처리" + keep);
		keepService.KeepAddPro(keep);
		return "redirect:/keepList";
	}
	
	//보관품 리스트
	@RequestMapping(value="/keepList", method = RequestMethod.GET)
	public String keepList(Model model) {
		System.out.println("KeepController 보관품 리스트");
		keepService.KeepSession();
		model.addAttribute("keepList", keepService.keepList());
		return "/keep/keepList";
	}
	
	//보관품 수정 폼
	@RequestMapping(value="/keepMod", method = RequestMethod.GET)
	public String keepMod(Model model, @RequestParam("kCode") int kCode) {
		model.addAttribute("keep", keepService.keepModForm(kCode));
		return "keep/keepMod";
		
	}
	//보관품 수정 처리
	@RequestMapping(value="/keepMod", method = RequestMethod.POST)
	public String keepModPro(Keep keep) {
		System.out.println("KeepController 보관품 수정 처리");
		keepService.KeepMod(keep);
		return "redirect:/keepList";
	}
	}

