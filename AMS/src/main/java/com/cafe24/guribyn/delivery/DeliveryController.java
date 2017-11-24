package com.cafe24.guribyn.delivery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;

	//운송 등록 폼
	@RequestMapping("deliveryAdd")
	public String deliveryAdd() {
		return "delivery/deliveryAdd";
	}
	//운송 등록 처리
	@RequestMapping(value = "deliveryAdd", method = RequestMethod.POST)
	public String DeliveryAddPro(Delivery delivery) {
		deliveryService.deliveryAddPro(delivery);
		return "redirect:/deliveryList";
	}
	//운송 목록
	@RequestMapping(value="/deliveryList", method = RequestMethod.GET)
	public String deliveryList(Model model) {
		deliveryService.deliveryList(model);
		return "/delivery/deliveryList";
	}
	
	//분류에 맞는 보관품 목록
	@ResponseBody
	@RequestMapping(value = "kName")
	public String kName(@RequestParam ("kCode") String kCode) {
		return deliveryService.kName(kCode);
	}
}
