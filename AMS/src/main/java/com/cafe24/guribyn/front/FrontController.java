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
	
	//프론트 세션 설정 & 전체 객실 불러오기
	@RequestMapping(value="/frontMain")
	public String frontMain(Model model) {
		System.out.println("---프론트 메인---------from controller");
		frontService.FrontSesseion();
		frontService.allRoom(model);
		return "front/frontMain";
	}
	//한 객실 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/frontDetail")
	public String frontDetailRoomType(@RequestParam ("FrCode") String FrCode) {
		System.out.println("---해당객실 정보---------from controller");
		System.out.println(FrCode);
		return frontService.roomDetailFromFront(FrCode); 
	}
}
