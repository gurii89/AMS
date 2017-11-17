package com.cafe24.guribyn.front;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.room.Room;
import com.cafe24.guribyn.room.RoomService;

@Service
public class FrontService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomService roomService;
	
	//프로트 세션 설정
	public String FrontSesseion() {
		session.setAttribute("top", "front");
		return "";
	}
	//선택된 객실 정보 불러오기1
	public String roomDetailType(String roomCode) {
		System.out.println("---해당객실 정보---------from service");
		Room room = roomService.roomDetail(roomCode);
		String drt = room.getRoomTypeCode();
		System.out.println(drt);
		return drt;
	}
}
