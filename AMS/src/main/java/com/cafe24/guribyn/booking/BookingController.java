package com.cafe24.guribyn.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String bookingAddPro(Model model, Booking booking) {
		model.addAttribute("booCode", bookingService.bookingAddPro(booking));
		return "redirect:/bookingDetail";
	}
	
	// 예약 목록
	@RequestMapping("bookingList")
	public String bookingList(Model model
			, @RequestParam(value = "cate", required=false) String cate 
			, @RequestParam(value = "input", required=false) String input
			, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		bookingService.bookingList(model, currentPage, cate, input);
		return "booking/bookingList";
	}
	
	// 예약 개수 확인
	@ResponseBody
	@RequestMapping(value = "bookingCount")
	public String bookingCount() {
		return bookingService.bookingCount();
	}
	
	// 예약 고객 등록을 위한 예약 목록
	@ResponseBody
	@RequestMapping(value = "bookingGuestBooking")
	public String bookingGuestBooking(@RequestParam("currentPage") int currentPage
									, @RequestParam("pagePerRow") int pagePerRow) {
		return bookingService.bookingGuestBooking(currentPage, pagePerRow);
	}
	
	// 예약 상세
	@RequestMapping(value = "bookingDetail")
	public String bookingDetail(Model model, @RequestParam("booCode") int booCode) {
		bookingService.bookingOne(model, booCode);
		return "booking/bookingDetail";
	}
	
	// 예약 취소
	@RequestMapping(value = "bookingCancel")
	public String bookingCancel(Model model, @RequestParam("booCode") String booCode) {
		bookingService.bookingCancel(booCode);
		model.addAttribute("booCode", booCode);
		return "redirect:/bookingDetail";
	}
	
}
