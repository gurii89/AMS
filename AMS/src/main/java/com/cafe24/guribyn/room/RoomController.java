package com.cafe24.guribyn.room;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
	//객실등록폼
	@RequestMapping(value="/roomAdd", method = RequestMethod.GET)
	public String roomAddForm(Model model) {
		System.out.println("---객실등록폼---------from controller");
		model.addAttribute("roomTypeSelect", roomService.roomTypeList());
		return "/room/roomAdd";
	}
	//룸코드 중복검사
	@ResponseBody
	@RequestMapping(value = "/rtDupTest")
	public String rtDuptest(@RequestParam ("insertRt") String insertRt) {
		System.out.println("---룸코드 중복검사---------from controller");
		System.out.println("insertRt"+insertRt);
		Gson gson = new Gson();
		return gson.toJson(roomService.RoomCodeDup(insertRt));
	}
	//객실등록처리
	@RequestMapping(value="/roomAdd", method = RequestMethod.POST)
	public String roomAdd(Room room, Model model) {
		System.out.println("---객실등록처리---------from controller");
		int resulT = roomService.RoomAdd(room);
			//중복검사 후 정상 등록
			if(resulT == 1) {
				return "redirect:/roomTypeList";
			}
			//중복검사 후 재등록 요청
			else {
				model.addAttribute("insertRequest", "insertRequest");
				return "/room/roomAdd";
			}
	}
	//객실 리스트
	@RequestMapping(value="/roomList", method = RequestMethod.GET)
	public String roomList(Model model) {
		System.out.println("---객실 리스트---------from controller");
		model.addAttribute("roomList", roomService.roomList());
		System.out.println(model);
		return "/room/roomList";
	}
	//객실 특징 등록폼
	@RequestMapping(value="/roomOptionAdd", method = RequestMethod.GET)
	public String roomOptionForm(Model model, @RequestParam("rtcode") String rtcode) {
		System.out.println("---객실 특징 등록폼---------from controller");
		model.addAttribute("rtcode", rtcode);
		model.addAttribute("roomOptionCatelarge", roomService.RoomOptionCate());
		return "/room/roomOptionAdd";
	}
	//특징 명 가져오기
	@ResponseBody
	@RequestMapping(value = "/roomOptionCateSamll")
	public String cateSmall(@RequestParam ("large") String large) {
		//System.out.println("대분류선택햇나"+large);
		return roomService.cateSmallOnlyName(large);
	}
	//객실 특징 등록처리
	@RequestMapping(value="/roomOptionAdd", method = RequestMethod.POST)
	public String roomOptionAdd(RoomOption roomOption) {
		System.out.println("---객실 특징 등록처리---------from controller");
		roomService.RoomOptionAdd(roomOption);
		return "redirect:/roomTypeList";
	}
	//객실 특징 목록
	@ResponseBody
	@RequestMapping(value="/roomOptionList", method = RequestMethod.GET)
	public String roomOptionList(Model model, @RequestParam("rcc") String roomTypeCode) {
		System.out.println("---객실 특징 리스트---------from controller");
		roomService.RoomOptionList(roomTypeCode);
		Gson gson = new Gson();
		return gson.toJson(roomService.RoomOptionList(roomTypeCode));
	}
	//객실 특징 중복검사
	@ResponseBody
	@RequestMapping(value="/optionCheck")
	public String optionCheck(@RequestParam ("cateCode") String cateCode, @RequestParam ("roomTypeCode") String roomTypeCode) {
		System.out.println("---객실 특징 중복검사---------from controller");
		return roomService.optionCheck(cateCode, roomTypeCode);
	}
	//객실 특징 삭제
	@RequestMapping(value="/roomOptionDelete", method = RequestMethod.GET)
	public String roomOptionDelete(@RequestParam ("rort") String rort, @RequestParam ("rocat") String rocat) {
		System.out.println("---객실 특징 삭제---------from controller");
		roomService.roomOptionDelete(rort, rocat);
		return "redirect:/roomTypeList";
	}
	//객실 상태 입력
	@RequestMapping(value="/roomConAdd", method = RequestMethod.POST)
	public String roomConAdd(RoomCondition roomCondition) {
		System.out.println("---객실상태록처리---------from controller");
		roomService.RoomConditionAdd(roomCondition);
		return "redirect:/frontMain";	
	} 
	//객실 종류 번호로 객실 호수 찾아오기
	@ResponseBody
	@RequestMapping(value = "bookingRoomCode")
	public String bookingRoomCode(@RequestParam("roomTypeCode") int roomTypeCode) {
		return roomService.bookingRoomCode(roomTypeCode);
	}
	//예약된 객실 호수 찾기
	@ResponseBody
	@RequestMapping(value = "bookingSearchRoom")
	public String bookingSearchRoom(@RequestParam("booRoomCode") int booRoomCode) {
		return roomService.bookingSearchRoom(booRoomCode);
	}
	
}
