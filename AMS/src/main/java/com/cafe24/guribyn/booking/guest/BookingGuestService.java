package com.cafe24.guribyn.booking.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingGuestService {

	@Autowired
	BookingGuestDao bookingGuestDao;
		
	// 예약 고객 등록 처리
	public String bookingGuestAddPro(String booCode, String gCode) {
		int boo = Integer.parseInt(booCode);
		int g = Integer.parseInt(gCode);
		BookingGuest bookingGuest = new BookingGuest();
		bookingGuest.setBooCode(boo);
		bookingGuest.setgCode(g);
		try {
			bookingGuestDao.bookingGuestAdd(bookingGuest);
			return "ok";
		} catch (Exception e) {
			return "no";
		}
	}
	
}
