package com.cafe24.guribyn.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
