package com.cafe24.guribyn.delivery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		deliveryService.DeliveryAddPro(delivery);
		return "redirect:/deliveryList";
	}

}