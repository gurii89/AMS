package com.cafe24.guribyn.front;

import org.springframework.ui.Model;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.guribyn.room.RoomType;

@Controller
public class FrontController {
	@Autowired
	private FrontService frontService;
	
	//프론트 세션 설정 & 전체 객실 불러오기
	@RequestMapping(value="/frontMain")
	public String frontMain(Model model) throws ParseException {
		System.out.println("---프론트 메인---------from controller");
		frontService.FrontSesseion();
		frontService.allRoom(model);
		return "front/frontMain";
	}
	//한 객실 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/frontDetail")
	public String frontDetailRoomType(Model model, @RequestParam ("FrCode") String FrCode) throws ParseException {
		System.out.println("---해당객실 정보---------from controller");
		System.out.println(FrCode);
		return frontService.roomDetailFromFront(model, FrCode); 
	}
	//층수 받아오기
	@RequestMapping(value="/frontfloor", method = RequestMethod.GET)
	public String frontfloor(Model model, @RequestParam ("ffloof") String ffloof) throws ParseException {
		System.out.println("---선택된 층수---------from controller");
		frontService.allRoom(model);
		int k = Integer.parseInt(ffloof);
		model.addAttribute("selfrontfloor", ffloof);
		return "front/frontFloor";
	}
	//타입 받아오기
	@RequestMapping(value="/frontrt", method = RequestMethod.GET)
	public String frontrt(Model model, @RequestParam ("ffrt") String ffrt) throws ParseException {
		System.out.println("---선택된 타입---------from controller");
		System.out.println(ffrt);
		frontService.allRoom(model);
		model.addAttribute("selfrontrt", ffrt);
		return "front/frontRoomType";
	}
	//프론트 서비스 페이지
	@RequestMapping(value="/frontService", method = RequestMethod.GET)
	public String frontService(Model model) {
		System.out.println("---프론트 서비스 메인---------from controller");
		frontService.extraFront(model);
		return "front/frontService";
	}
	//예약상세 페이지로 보내기
	@RequestMapping(value="/goBooPage", method = RequestMethod.GET)
	public String goBooPage(@RequestParam ("rtCode") String rtCode, Model model) {
		System.out.println("---프론트 서비스 메인---------from controller");
		System.out.println("부코드 가져올랭"+rtCode);
		return frontService.goBooPage(rtCode, model);
	}
}
