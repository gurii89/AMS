package com.cafe24.guribyn.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
		
	// 결제 등록 폼
	@RequestMapping(value="paymentAdd")
	public String paymentAdd(Model model, @RequestParam("booCode") int booCode
							, @RequestParam("payTotal") int payTotal) {
		model.addAttribute("booCode", booCode);
		model.addAttribute("payTotal", payTotal);
		return "payment/paymentAdd";
	}
	
	// 결제 등록 처리
	@RequestMapping(value="paymentAdd", method = RequestMethod.POST)
	public String paymentAddPro(Payment payment, Model model) {
		paymentService.paymentAddPro(payment, model);
		return "redirect:/bookingDetail";
	}
	
	// 결제 목록
	@RequestMapping("paymentList")
	public String paymentList(Model model
			, @RequestParam(value = "cate", required=false) String cate 
			, @RequestParam(value = "input", required=false) String input
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		paymentService.paymentList(model, currentPage, cate, input);
		return "payment/paymentList";
	}
	
	// 결제 취소
	@RequestMapping("paymentCancel")
	public String paymentCancel(@RequestParam(value = "pCode") int pCode) {
		paymentService.paymentCancel(pCode);
		return "redirect:/paymentList";
	}
	
}
