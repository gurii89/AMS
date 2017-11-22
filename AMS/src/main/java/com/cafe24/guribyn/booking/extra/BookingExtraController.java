package com.cafe24.guribyn.booking.extra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookingExtraController {

	@Autowired
	BookingExtraService bookingExtraService;
	
	// 이용 서비스 임시 등록(세션에 보관)
	@ResponseBody
	@RequestMapping(value = "bookingExtra")
	public String bookingExtra(@RequestParam ("extraCode") String extraCode
							, @RequestParam ("extraRate") String extraRate
							, @RequestParam ("extraDate") String extraDate) {
		return bookingExtraService.bookingExtra(extraCode, extraRate, extraDate);
	}
	
}
