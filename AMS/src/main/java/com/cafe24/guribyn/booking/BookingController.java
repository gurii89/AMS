package com.cafe24.guribyn.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	
	// 예약 등록 폼
	@RequestMapping("bookingAdd")
	public String bookingAdd(Model model) {
		bookingService.bookingAdd(model);
		return "booking/bookingAdd";
	}
	
	// 예약 등록 처리
	@RequestMapping(value = "bookingAdd", method = RequestMethod.POST)
	public String bookingAddPro(Booking booking) {
		bookingService.bookingAddPro(booking);
		return "redirect:/bookingList";
	}
	
	// 예약 목록
	@RequestMapping("bookingList")
	public String bookingList(Model model
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		bookingService.bookingList(model, currentPage);
		return "booking/bookingList";
	}
	
}
