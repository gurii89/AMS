package com.cafe24.guribyn.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.login.Login;
import com.google.gson.Gson;

@Service
public class EventService {
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	HttpSession session;

	// 행사 등록 처리
	public void eventAddPro(Event event) {
		if(event.getEventStart().equals("")) {
			event.setEventStart(null);
		}
		if(event.getEventEnd().equals("")) {
			event.setEventEnd(null);
		}
		Login result = (Login)session.getAttribute("loginfor");
		event.seteId(result.geteId());
		eventDao.eventAdd(event);
	}
	
	// 행사 목록
	public void eventList(Model model) {
		model.addAttribute("eventList", eventDao.eventList());
		session.setAttribute("top", "event");
	}
	
	// 행사 시작일 종료일 체크
	public String eventCheck(String someday) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("someday", someday);
		List<Event> list = eventDao.eventCheck(map);
		if(list.size() == 0) {
			return null;
		}
		Gson gson = new Gson();
		return gson.toJson(list.get(0));		
	}
	
	// 기본 행사 중복 검사
	public String eventFx(double fx) {
		if(eventDao.eventFx(fx) != 0) {
			return "no";
		}
		return "ok";
	}
	
}
