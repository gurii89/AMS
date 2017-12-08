package com.cafe24.guribyn.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.guribyn.booking.guest.BookingGuestService;
import com.cafe24.guribyn.cate.CateService;

@Controller
public class GuestController {
	
	@Autowired
	CateService cateService;
	
	@Autowired
	GuestService guestService;
	
	@Autowired
	BookingGuestService bookingGuestService;
	
	// 고객 등록 폼
	@RequestMapping(value = "/guestAdd")
	public String guestAdd(Model model, @RequestParam("booCode") String booCode
					, @RequestParam(value = "cate", required=false) String cate 
					, @RequestParam(value = "input", required=false) String input
					, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		cateService.cateOptionSearch(model, "cate_small", "nation");
		guestService.guestBookingList(model, currentPage, cate, input, booCode);
		model.addAttribute("booCode",booCode);		
		return "guest/guestAdd";
	}
	
	// 고객 등록 처리
	@RequestMapping(value = "/guestAddPro", method = RequestMethod.POST)
	public String guestAddPro(Model model, Guest guest, @RequestParam("booCode") int booCode) {
		guestService.guestAddPro(guest);
		bookingGuestService.bookingGuestAddPro(booCode, 0);
		model.addAttribute("booCode", booCode);
		return "redirect:/bookingDetail";
	}
	
	// 고객 목록
	@RequestMapping(value = "/guestList")
	public String guestList(Model model
					, @RequestParam(value = "cate", required=false) String cate 
					, @RequestParam(value = "input", required=false) String input
					, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
			guestService.guestList(model, currentPage, cate, input);
		return "guest/guestList";
	}
	
	// 고객 수정 폼
	@RequestMapping(value = "/guestMod")
	public String guestMod(Model model, @RequestParam("gCode") int gCode) {
		guestService.guestOne(model, gCode);
		return "guest/guestMod";
	}
	
	// 고객 수정 처리
	@RequestMapping(value = "/guestMod", method = RequestMethod.POST)
	public String guestModPro(Guest guest) {
		guestService.guestMod(guest);
		return "redirect:/guestList";
	}
	
	// 고객수 확인
	@ResponseBody
	@RequestMapping(value = "guestCount")
	public String guestCount() {
		return guestService.guestCount();
	}
	
	// 예약 고객 등록을 위한 고객 목록
	@ResponseBody
	@RequestMapping(value = "bookingGuest")
	public String bookingGuest(@RequestParam("currentPage") int currentPage, @RequestParam("pagePerRow") int pagePerRow) {
		return guestService.bookingGuest(currentPage, pagePerRow);
	}
	
}
