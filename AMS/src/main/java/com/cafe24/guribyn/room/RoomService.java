package com.cafe24.guribyn.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.room.RoomDao;

@Service
public class RoomService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomDao roomDao;
	
	//객실타입 전체 리스트
	public List<RoomType> roomTypeList(){
		System.out.println("---객실타입 전체리스트---------from service");
		return roomDao.RoomTypeList();	
	}
	//객실 세션 설정
	public String RoomSesseion() {
		session.setAttribute("top", "room");
		return "";
	}
	//객실타입 등록처리
	public int RoomTypeAdd(RoomType roomType) {
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomTypeAdd(roomType);
	}
	//객실 등록처리
	public int RoomAdd(Room room) {
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomAdd(room);
	}
	public List<Room> roomList(){
		System.out.println("---객실 전체리스트---------from service");
		return roomDao.RoomList();	
	}
}
