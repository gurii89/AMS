package com.cafe24.guribyn.booking.guest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingGuestDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.booking.guest.BookingGuestMapper.";
	
	// 예약 고객 등록 처리
	public void bookingGuestAdd(BookingGuest bookingGuest) {
		SST.insert(NS+"bookingGuestAdd", bookingGuest);
	}
	
}
