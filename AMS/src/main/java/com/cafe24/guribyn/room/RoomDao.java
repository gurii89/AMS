package com.cafe24.guribyn.room;

import java.util.List;

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
}
