package com.cafe24.guribyn.clean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


@Controller
public class CleanController {
	
	@Autowired
	private CleanService cleanService;
	
	//청소 메인페이지 이동
	@RequestMapping(value="/cleanMain")
	public String cleanMain(Model model) {
		System.out.println("---청소 메인---------from controller");
		cleanService.cleanSesseion();
		cleanService.RoomRcCon(model);
		return "clean/cleanMain";
	}
	//청소 시작
	@ResponseBody
	@RequestMapping(value="/cleanStart")
	public String cleanStart(@RequestParam("Crc") String roomCode, @RequestParam("eId") String eId){
		System.out.println("---청소 시작---------from controller");
		System.out.println("룸코드:"+roomCode+"아이디:"+eId);
		cleanService.cleanStart(roomCode, eId);
		return "redirect:/cleanMain";
	}
	//청소시작 시간 불러오기
	@ResponseBody
	@RequestMapping(value="/cleanStartTime")
	public String cleanStartTime(@RequestParam("Crc") String roomCode, @RequestParam("eId") String eId) {
		System.out.println("---청소 시작시간 불러오기---------from controller");
		Gson gson = new Gson();
		return gson.toJson(cleanService.cleanStartTime(roomCode, eId));
	}
	//청소중인 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="/cleanList")
	public String cleanList() {
		System.out.println("---청소중인 리스트 불러오기---------from controller");
		Gson gson = new Gson();
		return gson.toJson(cleanService.cleanList());
	}
}
