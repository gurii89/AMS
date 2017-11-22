package com.cafe24.guribyn.booking.extra;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingExtraDao {

	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.booking.extra.BookingExtraMapper.";
	
	// 예약 서비스 등록
	public void bookingExtraAdd(BookingExtra bookingExtra) {
		SST.insert(NS+"bookingExtraAdd", bookingExtra);
	}
	
}
