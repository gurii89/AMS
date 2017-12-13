package com.cafe24.guribyn.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.room.RoomDao;
import com.google.gson.Gson;
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
		//리턴값에 따라 중복검사 하기
		int insertResult = roomDao.RoomTypeAdd(roomType);
		System.out.println(insertResult);
		return insertResult;
	}
	//객실 등록처리
	public int RoomAdd(Room room){
		System.out.println("---객실등록처리---------from service");
		roomDao.RoomAdd(room);
		
		RoomCondition roomcon = new RoomCondition();
		roomcon.seteId(room.geteId());
		roomcon.setRoomCode(room.getRoomCode());
			
		//최초 등록시 상태를 공실로 INSERT
		roomcon.setRoomConCondition("공실");
		return roomDao.RoomConditionAdd(roomcon);
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
	public int roomOptionDelete(String rort, String rocat) {
		System.out.println("---객실 특징 삭제---------from service");
		Map<String, String> map = new HashMap<String, String>();
		map.put("rort", rort);
		map.put("rocat", rocat);
		return roomDao.RoomOptionDelete(map);
	}
	//객실 전체 호수 정렬한것
	public List<Room> roomToFront(){
		System.out.println("---전체 객실 호수 가져오기---------from service");
		return roomDao.roomCode();
	}
	//한 객실 정보 가져오기
	public Room roomDetailFromFront(String FrCode) {
		System.out.println("---해당객실 룸타입 불러오기---------from service");
		return roomDao.roomDetailFromFront(FrCode);
	}
	//한 객실상태 시간 가져오기
	public RoomCondition RoomConTime(String FrCode) {
		System.out.println("---해당객실 룸타입 불러오기---------from service");
		return roomDao.RoomConTime(FrCode);
	}
	//객실 상태 등록처리!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public int RoomConditionAdd(RoomCondition roomCondition){
		System.out.println("---객실상태 등록처리---------from service");
		return roomDao.RoomConditionAdd(roomCondition);
	}
	//룸코드 중복검사
	public String RoomCodeDup(String insertRt) {
		System.out.println("---룸코드 중복검사---------from service");
		Room roomResult = roomDao.RoomCodeDup(insertRt);
		String dupResult = "";
		if(roomResult == null) {
			dupResult ="ok";
		}else {
			dupResult ="no";
		}
		return dupResult;
	}
	//한 객실 상태 불러오기
	public String RoomConditionview(String FrCode) {
		System.out.println("---객실상태 불러오기---------from service");
		return roomDao.RoomConditionshow(FrCode);
	}
	//전체 객실 코드와 상태 불러오기(청소)
	public List<RoomCondition> RoomRcCon() {
		System.out.println("---룸서비스임전체 객실코드, 상태 불러오기---------from service");
		return roomDao.RoomRcCon();
	}
	//전체 객실 코드와 상태 불러오기(프론트)
	public List<RoomCondition> RoomRcAllCon() {
		System.out.println("---룸서비스임전체 객실코드, 상태 불러오기 프론트---------from service");
		return roomDao.RoomRcAllCon();
	}
	// 객실 종류 번호로 객실 호수 찾아오기
	public String bookingRoomCode(int roomTypeCode) {
		Gson gson = new Gson();
		return gson.toJson(roomDao.bookingRoomCode(roomTypeCode));
	}
	// 예약된 객실 호수 찾아오기
	public String bookingSearchRoom(int booRoomCode) {
		try {
			return Integer.toString(roomDao.bookingSearchRoom(booRoomCode));
		} catch (Exception e) {
			return null;
		}

	}
}
