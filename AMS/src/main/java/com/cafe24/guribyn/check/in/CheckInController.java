package com.cafe24.guribyn.check.in;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CheckInController {
	
	@Autowired
	CheckInService checkInService;
	
	// 체크인 등록 처리
	@ResponseBody
	@RequestMapping(value = "checkInAdd")
	public void checkInAddPro(CheckIn checkIn) {
		checkInService.checkInAdd(checkIn);
	}
	
}
