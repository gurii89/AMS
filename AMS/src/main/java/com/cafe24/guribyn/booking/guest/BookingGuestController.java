package com.cafe24.guribyn.booking.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookingGuestController {
	
	@Autowired
	BookingGuestService bookingGuestService; 

	// 예약 고객 등록 폼
	@RequestMapping("bookingGuestAdd")
	public String bookingGuestAdd() {
		return "booking/bookingGuest";
	}
	
	// 예약 고객 등록 처리
	@ResponseBody
	@RequestMapping("bookingGuestAddPro")
	public String bookingGuestAddPro(@RequestParam ("booCode") String booCode
									, @RequestParam ("gCode") String gCode) {
		return bookingGuestService.bookingGuestAddPro(booCode, gCode);
	}
	
}
