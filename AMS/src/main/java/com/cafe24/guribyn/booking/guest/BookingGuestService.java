package com.cafe24.guribyn.booking.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingGuestService {

	@Autowired
	BookingGuestDao bookingGuestDao;
		
	// 예약 고객 등록 처리
	public String bookingGuestAddPro(int booCode, int gCode) {
		BookingGuest bookingGuest = new BookingGuest();
		bookingGuest.setBooCode(booCode);
		bookingGuest.setgCode(gCode);
		if(bookingGuestDao.bookingGuestCheck(bookingGuest) != 0) {
			return "no";
		}
		bookingGuestDao.bookingGuestAdd(bookingGuest);
		return "ok";
	}
	
}
