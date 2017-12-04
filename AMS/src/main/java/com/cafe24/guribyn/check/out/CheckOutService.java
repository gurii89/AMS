package com.cafe24.guribyn.check.out;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.guribyn.booking.BookingDao;
import com.cafe24.guribyn.booking.room.BookingRoomDao;
import com.cafe24.guribyn.check.in.CheckInDao;
import com.cafe24.guribyn.login.Login;
import com.cafe24.guribyn.room.RoomCondition;
import com.cafe24.guribyn.room.RoomDao;

@Service
public class CheckOutService {

	@Autowired
	CheckOutDao checkOutDao;
	
	@Autowired
	BookingDao bookingDao;
	
	@Autowired
	BookingRoomDao bookingRoomDao;
	
	@Autowired
	CheckInDao checkInDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	RoomDao roomDao;
	
	// 체크아웃 처리
	public void checkOutAddPro(int booCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("booCode", Integer.toString(booCode));
		map.put("condition", "퇴실");
		bookingDao.bookingCondition(map);
		bookingRoomDao.bookingRoomCondition(map);
		
		List<Integer> list = checkInDao.inSearchRoom(booCode);
		RoomCondition roomCon = new RoomCondition();
		Login result = (Login)session.getAttribute("loginfor");
		roomCon.seteId(result.geteId());
		roomCon.setRoomConCondition("청소요청");
		for(int room : list) {
			roomCon.setRoomCode(Integer.toString(room));
			roomDao.RoomConditionAdd(roomCon);
		}
		
		CheckOut checkOut = new CheckOut();
		checkOut.setBooCode(booCode);
		checkOut.seteId(result.geteId());
		checkOutDao.checkOutAdd(checkOut);
	}
	
}
