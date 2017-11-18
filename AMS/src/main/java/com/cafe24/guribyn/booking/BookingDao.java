package com.cafe24.guribyn.booking;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.booking.BookingMapper.";
	
	// 예약 등록
	public void bookingAddPro(Booking booking) {
		SST.insert(NS+"bookingAdd", booking);
	}
}
