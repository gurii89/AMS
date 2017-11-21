package com.cafe24.guribyn.booking;

import java.util.List;
import java.util.Map;

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
	
	// 예약 목록
	public List<Booking> bookingList(Map<String, Integer> map){
		return SST.selectList(NS+"bookingList", map);
	}
	
	// 예약 건 목록 개수
	public int bookingCount() {
		return SST.selectOne(NS+"bookingCount");
	}
	
	// 예약 건 검색 개수
	public int bookingSearchCount(Map<String, String> map) {
		return SST.selectOne(NS+"bookingCount", map);
	}
	
	// 예약 검색
	public List<Booking> bookingSearch(Map<String, String> map){
		return SST.selectList(NS+"bookingList", map);
	}
	
}
