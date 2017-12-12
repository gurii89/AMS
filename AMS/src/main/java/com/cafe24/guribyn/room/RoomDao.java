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
	//룸코드 중복검사
	public Room RoomCodeDup(String insertrt) {
		System.out.println("---룸코드 중복검사---------from dao");
		System.out.println(sqlSessionTemplate.selectOne(NS+".selectRoomDupTest", insertrt));
		return sqlSessionTemplate.selectOne(NS+".selectRoomDupTest", insertrt);
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
	//한 객실의 상태 시간 불러오기
	public RoomCondition RoomConTime(String roomCode) {
		System.out.println("---한 객실상태 시간 불러오기---------from dao");
		return sqlSessionTemplate.selectOne(NS+".selectOneRcConTime", roomCode);
	}

	//전체 객실 코드와 상태 불러오기(청소)
	public List<RoomCondition> RoomRcCon () {
		System.out.println("---전체 객실코드, 상태 불러오기---------from dao");
		return sqlSessionTemplate.selectList(NS+".selectRcCon");
	}
	//전체 객실 코드와 상태 불러오기(프론트)
		public List<RoomCondition> RoomRcAllCon () {
			System.out.println("---전체 객실코드, 상태 불러오기---------from dao");
			return sqlSessionTemplate.selectList(NS+".selectAllRcCon");
		}
	//객실 종류 이름으로 객실 호수 찾아오기
	public List<Room> bookingRoomCode(int roomTypeCode) {
		return sqlSessionTemplate.selectList(NS+".bookingRoomCode", roomTypeCode);
	}
	//예약된 객실 호수 찾기
	public int bookingSearchRoom(int booRoomCode) {
		return sqlSessionTemplate.selectOne(NS+".bookingSearchRoom", booRoomCode);
	}
	//총 객실 수
	public int roomCount() {
		return sqlSessionTemplate.selectOne(NS+".selectRoomCount");
	}
}
