package com.cafe24.guribyn.room;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NS="com.cafe24.guribyn.room.RoomMapper";
	//객실 타입 등록처리
	public int RoomTypeAdd(RoomType roomType) {
		System.out.println("---객실타입등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertRoomType", roomType);
	}
	//객실 타입 전체 리스트
	public List<RoomType> RoomTypeList(){
		System.out.println("---객실타입 전체리스트---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRoomType");
	}
	//객실 등록처리
	public int RoomAdd(Room room) {
		System.out.println("---객실등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertRoom", room);
	}
	//객실 전체 리스트
	public List<Room> RoomList(){
		System.out.println("---객실 전체리스트---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRoom");
	}
	//객실 특징 등록처리
	public int RoomOptionAdd(RoomOption roomOption) {
		System.out.println("---객실등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertRoomOption", roomOption);
	}
	//객실 특징 목록
	public List<RoomOption> RommOptionList(String roomTypeCode){
		System.out.println("---객실특징 리스트---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRoomOption", roomTypeCode);
	}
	//객실 특징 중복검사
	public List<RoomOption> optionCheck(Map<String, String> map) {
		System.out.println("---객실특징 중복검사 --------from dao");
		List<RoomOption> test = sqlSessionTemplate.selectList(NS+".optionCheck", map);
		return test;
	}
	//객실 특징 삭제
	public int RoomOptionDelete(Map<String, String> map) {
		System.out.println("---객실특징 삭제 --------from dao");
		System.out.println(map);
		return sqlSessionTemplate.delete(NS+".deleteRoomOption", map);
	}
	//전체 객실 호수 셀렉트
	public List<Room> roomCode() {
		System.out.println("---전체 객실 호수 셀렉트---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRoomCode");
	}
	public Room roomDetailFromFront(String FrCode) {
		System.out.println("---한 객실 타입 셀렉트---------from dao");
		Room ree = sqlSessionTemplate.selectOne(NS+".selectFromFrontRT", FrCode);
		System.out.println(ree);
		return ree;
	}
	//객실 상태 등록
	public int RoomConditionAdd(RoomCondition roomCondition) {
		System.out.println("---객실상태등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertRoomCon", roomCondition);
	}
	//객실 상태 불러오기
	public String RoomConditionshow(String roomCode) {
		System.out.println("---객실상태 불러오기---------from dao");
		return sqlSessionTemplate.selectOne(NS+".selectRoomCon", roomCode);
	}
	//전체 객실 코드와 상태 불러오기
	public List<RoomCondition> RoomRcCon () {
		System.out.println("---전체 객실코드, 상태 불러오기---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRcCon");
	}
}
