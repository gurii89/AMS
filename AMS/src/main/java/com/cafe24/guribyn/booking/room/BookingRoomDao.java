package com.cafe24.guribyn.booking.room;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingRoomDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.booking.room.BookingRoomMapper.";
	
	// 예약 객실 등록
	public void bookingRoomAdd(BookingRoom bookingRoom) {
		SST.insert(NS+"bookingRoomAdd", bookingRoom);
	}
	
	// 예약 객실 목록
	public List<BookingRoom> bookingRoomList(int booCode){
		return SST.selectList(NS+"bookingRoomList", booCode);
	}
	
}
