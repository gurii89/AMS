package com.cafe24.guribyn.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	// 행사 등록 폼
	@RequestMapping("eventAdd")
	public String evnetAdd() {
		return "event/eventAdd";
	}
	
	// 행사 등록 처리
	@RequestMapping(value = "eventAdd", method = RequestMethod.POST)
	public String eventAddPro(Event event) {
		eventService.eventAddPro(event);
		return "redirect:/eventList";
	}
	
	// 행사 목록
	@RequestMapping("eventList")
	public String evnetList(Model model) {
		eventService.eventList(model);
		return "event/eventList";
	}
	
	// 행사 시작일, 종료일 체크
	@ResponseBody
	@RequestMapping(value = "eventCheck")
	public String extraName(@RequestParam ("someday") String someday) {
		return eventService.eventCheck(someday);
	}
	
	// 기본 행사 fx 중복불가
	@ResponseBody
	@RequestMapping(value = "eventFx")
	public String eventFx(@RequestParam ("eventFx") int fx) {
		return eventService.eventFx(fx);
	}
	
}
