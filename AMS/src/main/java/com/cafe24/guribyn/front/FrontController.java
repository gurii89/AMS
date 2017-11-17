package com.cafe24.guribyn.front;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	@RequestMapping(value="/frontMain")
	public String frontMain(Model model) {
		System.out.println("---프론트 메인---------from controller");
		frontService.FrontSesseion();
		return "front/frontMain";
	}
	
	@ResponseBody
	@RequestMapping(value="/frontDetail")
	public String frontDetailRoomType(@RequestParam ("roomCode") String roomCode) {
		System.out.println("---해당객실 정보---------from controller");
		System.out.println(roomCode);
		return frontService.roomDetailType(roomCode); 
	}
}
