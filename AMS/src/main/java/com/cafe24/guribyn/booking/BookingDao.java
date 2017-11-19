package com.cafe24.guribyn.booking;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.guribyn.extra.Extra;
import com.cafe24.guribyn.room.Room;

@Repository
public class BookingDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.booking.BookingMapper.";
	
	// 예약 등록
	public void bookingAddPro(Booking booking) {
		SST.insert(NS+"bookingAdd", booking);
	}
	
	// 예약 서비스 등록
	public void bookingExtraAdd(Extra extra) {
		SST.insert(NS+"bookingExtraAdd", extra);
	}
	
	// 예약 객실 등록
	public void bookingRoomAdd(Room room) {
		SST.insert(NS+"bookingRoomAdd", room);
	}
	
}
