package com.cafe24.guribyn.booking;

import java.util.List;
import java.util.Map;

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
	public void bookingCondition(Map<String, String> map) {
		SST.update(NS+"bookingCondition", map);
	}
	
	// 가장 최근 예약 건 코드 확인
	public int searchBooCode() {
		return SST.selectOne(NS+"searchBooCode");
	}
	
	// 최근 일주일 예약 통계(차트를 위한 데이터)
	public List<Booking> bookingWeek(){
		return SST.selectList(NS+"bookingWeek");
	}
	
	// 총 매출
	public Booking bookingRate() {
		return SST.selectOne(NS+"bookingRate");
	}
	
}
