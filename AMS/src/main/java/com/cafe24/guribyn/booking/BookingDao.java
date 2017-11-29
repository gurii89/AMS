package com.cafe24.guribyn.booking;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.guribyn.check.in.CheckIn;

@Repository
public class BookingDao {

	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.booking.BookingMapper.";
	
	// 예약 등록
	public void bookingAddPro(Booking booking) {
		SST.insert(NS+"bookingAdd", booking);
	}
	
	// 예약 목록
	public List<Booking> bookingList(Map<String, String> map){
		return SST.selectList(NS+"bookingList", map);
	}
	
	// 예약 건 개수
	public int bookingCount(Map<String, String> map) {
		return SST.selectOne(NS+"bookingCount", map);
	}
	
	// 단일 예약 확인
	public Booking bookingOne(int booCode) {
		return SST.selectOne(NS+"bookingOne", booCode);
	}
	
	// 체크인시 예약 건 예약상태 변경
	public void bookingCheckIn(CheckIn checkIn) {
		SST.update(NS+"bookingCheckIn", checkIn);
	}
	
}
