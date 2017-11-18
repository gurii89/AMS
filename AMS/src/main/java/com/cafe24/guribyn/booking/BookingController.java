package com.cafe24.guribyn.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.guribyn.extra.Extra;

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
	
	@RequestMapping(value = "bookingAdd", method = RequestMethod.POST)
	public String bookingAddPro(Booking booking) {
		bookingService.bookingAddPro(booking);
		return "redirect:/bookingList";
	}
	
}
