package com.cafe24.guribyn.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String RoomSesseion(){
		session.setAttribute("top", "room");
		return "";
	}
	//객실타입 등록처리
	public int RoomTypeAdd(RoomType roomType){
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomTypeAdd(roomType);
	}
	//객실 등록처리
	public int RoomAdd(Room room){
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomAdd(room);
	}
	//객실 전체 리스트
	public List<Room> roomList(){
		System.out.println("---객실 전체리스트---------from service");
		return roomDao.RoomList();	
	}
	//카테고리 불러오기
	public List<Cate> RoomOptionCate(){
		return cateService.cateSmallOnly();
	}
	//카테고리 불러오기 2
	public String cateSmallOnlyName(String large){
		return cateService.cateSmallOnlyName(large);
	}
	//객실 특징 등록처리
	public int RoomOptionAdd(RoomOption roomOption){
		System.out.println("---객실타입등록처리---------from service");
		return roomDao.RoomOptionAdd(roomOption);
	}
	//객실 특징 목록
	public List<RoomOption> RoomOptionList(String roomTypeCode){
		System.out.println("---객실 특징 리스트---------from service");
		return roomDao.RommOptionList(roomTypeCode);
	}
	//객실 특징 중복 체크
	public String optionCheck(String cateCode, String roomTypeCode) {
		System.out.println("---객실 특징 중복검사---------from service");
		Map<String, String> map = new HashMap<String, String>();
		map.put("cateCode", cateCode);
		map.put("roomTypeCode", roomTypeCode);
		System.out.println("map>>>>>>>>>" + map);
		if(roomDao.optionCheck(map).isEmpty()) {
			return "ok";
		}else {
			return "no";
		}
	}
	//객실 특징 삭제
	public int roomOptionDelete(String rocode) {
		System.out.println("---객실 특징 삭제---------from service");
		return roomDao.RoomOptionDelete(rocode);
	}
	//객실 하나의 룸타입 불러오기
	public Room roomDetail(String roomCode) {
		System.out.println("---해당객실 룸타입 불러오기---------from service");
		return roomDao.roomDetail(roomCode);
	}
}
