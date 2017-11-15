package com.cafe24.guribyn.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.room.RoomDao;
import com.cafe24.guribyn.cate.Cate;
import com.cafe24.guribyn.cate.CateService;

@Service
public class RoomService {
	@Autowired
	HttpSession session;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private CateService cateService;
	
	
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
	//객실 전체 리스트
	public List<Room> roomList(){
		System.out.println("---객실 전체리스트---------from service");
		return roomDao.RoomList();	
	}
	//카테고리 불러오기
	public List<Cate> RoomOptionCate() {
		return cateService.cateSmallOnly();
	}
	//카테고리 불러오기 2
	public String cateSmallOnlyName(String large) {
		return cateService.cateSmallOnlyName(large);
	}
	//객실 특징 등록처리
	public int RoomOptionAdd(RoomOption roomOption) {
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomOptionAdd(roomOption);
	}
}
