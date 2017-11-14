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
	//객실타입등록 처리
	@RequestMapping(value="/roomTypeAdd", method = RequestMethod.POST)
	public String roomTypeAdd(RoomType roomType) {
		System.out.println("---객실타입등록처리---------from controller");
		roomService.RoomTypeAdd(roomType);
		return "redirect:/roomTypeList";	
	}
	//객실타입 리스트
	@RequestMapping(value="/roomTypeList", method = RequestMethod.GET)
	public String roomTypeList(Model model) {
		System.out.println("---객실타입 리스트---------from controller");
		model.addAttribute("roomTypeList", roomService.roomTypeList());
		System.out.println(model);
		return "/room/roomTypeList";
	}
	//객실특징등록폼
	@RequestMapping(value="/roomOptionAdd", method = RequestMethod.GET)
	public String roomOptionAddForm() {
		System.out.println("---객실특징등록폼---------from controller");
		return "/room/roomOptionAdd";
	}
	//객실등록폼
	@RequestMapping(value="/roomAdd", method = RequestMethod.GET)
	public String roomAddForm(Model model) {
		System.out.println("---객실등록폼---------from controller");
		model.addAttribute("roomTypeSelect", roomService.roomTypeList());
		return "/room/roomAdd";
	}
	//객실등록처리
	@RequestMapping(value="/roomAdd", method = RequestMethod.POST)
	public String roomAdd(Room room) {
		System.out.println("---객실등록처리---------from controller");
		roomService.RoomAdd(room);
		return "redirect:/roomTypeList";	
	}
	//객실 리스트
	@RequestMapping(value="/roomList", method = RequestMethod.GET)
	public String roomList(Model model) {
		System.out.println("---객실 리스트---------from controller");
		model.addAttribute("roomList", roomService.roomList());
		System.out.println(model);
		return "/room/roomList";
	}
}
