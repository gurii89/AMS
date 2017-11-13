package com.cafe24.guribyn.room;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	//객실 메인
	@RequestMapping(value="/roomMain", method = RequestMethod.GET)
	public String roomMain(Model model) {
		System.out.println("---룸 메인---------from controller");
		roomService.RoomSesseion();
		return "/room/roomMain";
	}
	//객실타입등록폼
	@RequestMapping(value="/roomTypeAdd", method = RequestMethod.GET)
	public String noticeAddForm() {
		System.out.println("---객실타입등록폼---------from controller");
		return "/room/roomTypeAdd";
	}
	//객실타입등록
	@RequestMapping(value="/roomTypeAdd", method = RequestMethod.POST)
	public String roomTypeAdd(RoomType roomType) {
		System.out.println("---객실타입등록처리---------from controller");
		roomService.RoomTypeAdd(roomType);
		return "redirect:/roomMain";	
	}
}
