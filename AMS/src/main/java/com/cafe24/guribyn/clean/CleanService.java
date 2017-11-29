package com.cafe24.guribyn.clean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.room.RoomService;

@Service
public class CleanService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CleanDao cleanDao;
	
	//청소 세션 설정
	public String cleanSesseion() {
		session.setAttribute("top", "clean");
		return "";
	}
	//전체 객실 불러오기
	public Model RoomRcCon(Model model) {
		roomService.RoomRcCon();
		System.out.println("---전체 객실 코드, 상태 불러오기---------from service");
		System.out.println(cleanDao.cleanList());
		System.out.println(roomService.RoomRcCon());
		return model.addAttribute("cleanrtcon", roomService.RoomRcCon());
	}
	//청소시작
	public int cleanStart(String roomCode, String eId) {
		System.out.println("---청소 시작---------from service");
		Clean clean = new Clean();
		clean.seteId(eId);
		clean.setRoomCode(roomCode);
	
		return cleanDao.cleanStart(clean);
	}
	//청소시작 시간 불러오기
	public Clean cleanStartTime(String roomCode, String eId) {
		System.out.println("---청소 시작 시간---------from service");
		Clean clean = new Clean();
		clean.seteId(eId);
		clean.setRoomCode(roomCode);
		return cleanDao.cleanStartTime(clean);
	}
}
