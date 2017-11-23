package com.cafe24.guribyn.booking.extra;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class BookingExtraService {
	
	@Autowired
	HttpSession session;
	
	// 예약 서비스 임시 등록
	public String bookingExtra(String extraCode, String extraRate, String extraDate) {
		List<BookingExtra> list;
		if(session.getAttribute("bookingExtra") == null) {
			list = new ArrayList<BookingExtra>();			
		}else {
			list = (List<BookingExtra>)session.getAttribute("bookingExtra");
		}
		
		BookingExtra bookingExtra = new BookingExtra();
		bookingExtra.setExtraCode(extraCode);
		bookingExtra.setBooExtraRate(Integer.parseInt(extraRate));
		bookingExtra.setBooExtraDate(extraDate);
		list.add(bookingExtra);
		session.setAttribute("bookingExtra", list);
		
		Gson gson = new Gson();
		return gson.toJson(bookingExtra);
		
	}
	
}
