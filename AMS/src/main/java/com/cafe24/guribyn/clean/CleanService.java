package com.cafe24.guribyn.clean;

import java.util.ArrayList;
import java.util.List;

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
		System.out.println("---클린서비스임 전체 객실 코드, 상태 불러오기---------from service");
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
	public List<Clean> cleanList() {
		System.out.println("---청소 중인 리스트---------from service");
		System.out.println("룸코드만 뽑기");	
		return cleanDao.cleanList();
	}
}
