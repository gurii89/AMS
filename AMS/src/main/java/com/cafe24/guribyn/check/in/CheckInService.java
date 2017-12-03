package com.cafe24.guribyn.check.in;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.booking.BookingDao;
import com.cafe24.guribyn.booking.room.BookingRoomDao;
import com.cafe24.guribyn.login.Login;
import com.cafe24.guribyn.room.RoomCondition;
import com.cafe24.guribyn.room.RoomDao;

@Service
public class CheckInService {

	@Autowired
	CheckInDao checkInDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BookingRoomDao bookingRoomDao;
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	BookingDao bookingDao;
	
	// 체크인 등록 처리
	public void checkInAddPro(CheckIn checkIn) {
		Login result = (Login)session.getAttribute("loginfor");		
		checkIn.seteId(result.geteId());
		checkInDao.checkIn(checkIn);
		Map<String, String> map = new HashMap<String, String>();
		map.put("booRoomCode", Integer.toString(checkIn.getBooRoomCode()));
		map.put("condition", "입실");
		bookingRoomDao.bookingRoomCondition(map);
		
		RoomCondition roomCondition = new RoomCondition();
		roomCondition.seteId(result.geteId());
		roomCondition.setRoomCode(Integer.toString(checkIn.getRoomCode()));
		roomCondition.setRoomConCondition("입실");
		roomDao.RoomConditionAdd(roomCondition);
		bookingDao.bookingCondition(map);
	}
	
}
