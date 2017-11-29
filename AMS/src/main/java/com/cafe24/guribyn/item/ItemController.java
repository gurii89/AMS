package com.cafe24.guribyn.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class ItemController {

	@Autowired
	CateService cateService;
	
	@Autowired
	ItemService itemService;
	
	//카테고리 포함한 물품 등록 폼 
	@RequestMapping(value = "/itemAdd")
	public String itemCate(Model model) {
		cateService.cateOption(model);
		return "item/itemAdd";
	}
	
	//물품 등록 처리
	@RequestMapping(value = "/itemAdd", method = RequestMethod.POST)
	public String item(Item item) {
		itemService.itemAddPro(item);
		return "redirect:/itemList";
	}
	
	//물품 목록
	@RequestMapping(value = "/itemList")
	public String itemList(Model model) {
		itemService.itemList(model);
		return "item/itemList";
	}
}
