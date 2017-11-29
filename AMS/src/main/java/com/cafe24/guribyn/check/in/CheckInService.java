package com.cafe24.guribyn.check.in;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	// 체크인 등록 처리
	public void checkInAdd(CheckIn checkIn) {
		Login result = (Login)session.getAttribute("loginfor");		
		checkIn.seteId(result.geteId());
		checkInDao.checkIn(checkIn);
		bookingRoomDao.bookingCheckIn(checkIn);
		RoomCondition roomCondition = new RoomCondition();
		roomCondition.seteId(result.geteId());
		roomCondition.setRoomCode(Integer.toString(checkIn.getRoomCode()));
		roomCondition.setRoomConCondition("체크인");
		roomDao.RoomConditionAdd(roomCondition);
	}
	
}
