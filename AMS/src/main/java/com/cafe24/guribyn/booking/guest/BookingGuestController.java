package com.cafe24.guribyn.booking.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingGuestController {
	
	@Autowired
	BookingGuestService bookingGuestService; 
	
	// 예약 고객 등록 처리
	@RequestMapping("bookingGuestAddPro")
	public String bookingGuestAddPro(Model model, @RequestParam ("booCode") int booCode
									, @RequestParam ("gCode") int gCode) {
		bookingGuestService.bookingGuestAddPro(booCode, gCode);
		model.addAttribute("booCode", booCode);
		return "redirect:/bookingDetail";
	}
	
}
