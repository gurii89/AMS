package com.cafe24.guribyn.booking.room;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class BookingRoomService {

	@Autowired
	HttpSession session;

	// 예약 객실 임시 등록
	public String bookingRoom(String roomTypeCode, String roomRate) {
		List<BookingRoom> list;
		if(session.getAttribute("bookingRoom") == null) {
			list = new ArrayList<BookingRoom>();			
		}else {
			list = (List<BookingRoom>)session.getAttribute("bookingRoom");
		}

		BookingRoom bookingRoom = new BookingRoom();
		bookingRoom.setRoomTypeCode(roomTypeCode);
		bookingRoom.setBooRoomRate(Integer.parseInt(roomRate));
	
		list.add(bookingRoom);
		session.setAttribute("bookingRoom", list);
		
		Gson gson = new Gson();
		return gson.toJson(bookingRoom);
	}

}
