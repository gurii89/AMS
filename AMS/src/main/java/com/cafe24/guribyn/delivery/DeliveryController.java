package com.cafe24.guribyn.delivery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.guribyn.cate.CateService;

@Controller
public class DeliveryController {
	
	@Autowired
	private CateService cateService;

	@Autowired
	private DeliveryService deliveryService;
	
	//운송 등록 폼 + 운송 카테고리 확인
	@RequestMapping(value = "/deliveryAdd")
	public String deliveryAdd(Model model) {
		cateService.cateOptionSearch(model, "cate_small", "delivery");
		return "delivery/deliveryAdd";
	}
	
	//운송 등록 처리
	@RequestMapping(value = "/deliveryAdd", method = RequestMethod.POST)
	public String deliveryAddPro(Delivery delivery) {
		deliveryService.deliveryAddPro(delivery);
		return "redirect:/deliveryList";
	}
	//운송 리스트
	@RequestMapping(value="/deliveryList", method = RequestMethod.GET)
	public String deliveryList(Model model) {
		deliveryService.deliverySession();
		model.addAttribute("deliveryList", deliveryService.deliveryList());
		return "/delivery/deliveryList";
	}
	
	//보관품 수정 폼
	@RequestMapping(value = "/deliveryMod", method = RequestMethod.GET)
	public String deliveryMod(Model model, @RequestParam("kCode") int kCode) {
		model.addAttribute("delivery", deliveryService.deliveryModForm(kCode));
		return "delivery/deliveryMod";
	}
	
	//보관품 수정 처리
	@RequestMapping(value="/deliveryMod", method = RequestMethod.POST)
	public String deliveryModePro(Delivery delivery) {
		deliveryService.deliveryMod(delivery);
		return "redirect:/deliveryList";
	}
}
