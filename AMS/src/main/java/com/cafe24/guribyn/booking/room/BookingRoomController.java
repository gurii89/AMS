package com.cafe24.guribyn.booking.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookingRoomController {

	@Autowired
	BookingRoomService bookingRoomService;  
	
	// 이용 객실 임시 등록(세션에 보관)
	@ResponseBody
	@RequestMapping(value = "bookingRoom")
	public String bookingRoom(@RequestParam ("roomTypeCode") String roomTypeCode
							, @RequestParam ("roomRate") String roomRate) {
		return bookingRoomService.bookingRoom(roomTypeCode, roomRate);
	}
	
}
