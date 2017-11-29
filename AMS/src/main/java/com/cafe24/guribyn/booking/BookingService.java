package com.cafe24.guribyn.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.booking.extra.BookingExtra;
import com.cafe24.guribyn.booking.extra.BookingExtraDao;
import com.cafe24.guribyn.booking.room.BookingRoom;
import com.cafe24.guribyn.booking.room.BookingRoomDao;
import com.cafe24.guribyn.cate.CateService;
import com.cafe24.guribyn.event.EventService;
import com.cafe24.guribyn.guest.GuestDao;
import com.cafe24.guribyn.login.Login;
import com.cafe24.guribyn.payment.PaymentDao;
import com.cafe24.guribyn.room.RoomService;
import com.google.gson.Gson;

@Service
public class BookingService {

	@Autowired
	CateService cateService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	BookingDao bookingDao;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	BookingExtraDao bookingExtraDao;
	
	@Autowired
	BookingRoomDao bookingRoomDao; 
	
	@Autowired
	GuestDao guestDao;
	
	@Autowired
	PaymentDao paymentDao;
	
	// 예약 등록 폼
	public void bookingAdd(Model model) {
		cateService.cateOptionSearch(model, "cate_small", "extra");
		eventService.eventCheck(model);
		model.addAttribute("roomTypeList", roomService.roomTypeList());
		session.setAttribute("bookingExtra", null);
		session.setAttribute("bookingRoom", null);
	}
	
	// 예약 등록 처리
	public void bookingAddPro(Booking booking) {
		Login result = (Login)session.getAttribute("loginfor");
		booking.seteId(result.geteId());
		if(booking.getBooPath().equals("")) {
			booking.setBooPath(null);
		}
		if(booking.getBooMemo().equals("")) {
			booking.setBooMemo(null);
		}
		bookingDao.bookingAddPro(booking);
		
		String eId = booking.geteId();
		
		// 예약 서비스 등록
		if(session.getAttribute("bookingExtra") != null) {
			for(BookingExtra e : (List<BookingExtra>)session.getAttribute("bookingExtra")) {
				e.seteId(eId);
				bookingExtraDao.bookingExtraAdd(e);
			}
			session.setAttribute("bookingExtra", null);
		}
		
		// 예약 객실 등록
		if(session.getAttribute("bookingRoom") != null) {
			for(BookingRoom r : (List<BookingRoom>)session.getAttribute("bookingRoom")) {
				r.seteId(eId);
				bookingRoomDao.bookingRoomAdd(r);
			}
			session.setAttribute("bookingRoom", null);
		}
	}
	
	// 예약 목록
	public void bookingList(Model model, int currentPage, String cate, String input) {
		Map<String, String> map;
		if(cate != "") { 
			map = new HashMap<String, String>();
			map.put("cate", cate);
			map.put("input", input);
		}else {
			map = null;
		}
		map = commonService.paging(model, currentPage, 2, bookingDao.bookingCount(map), map);
		model.addAttribute("bookingList", bookingDao.bookingList(map));
		session.setAttribute("top", "booking");
	}
	
	// 예약 개수
	public String bookingCount() {
		Gson gson = new Gson();
		return gson.toJson(bookingDao.bookingCount(null));
	}
	
	// 예약 고객을 위한 예약 목록
	public String bookingGuestBooking(int currentPage, int pagePerRow) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString((currentPage-1)*pagePerRow));
		map.put("pagePerRow", Integer.toString(pagePerRow));
		map.put("cate", "condition");
		Gson gson = new Gson();
		return gson.toJson(bookingDao.bookingList(map));
	}
	
	// 예약 상세
	public void bookingOne(Model model, int booCode) {
		model.addAttribute("booking", bookingDao.bookingOne(booCode));
		model.addAttribute("bookingExtraList", bookingExtraDao.bookingExtraList(booCode));
		model.addAttribute("bookingRoomList", bookingRoomDao.bookingRoomList(booCode));
		model.addAttribute("bookingGuestList", guestDao.bookingGusetList(booCode));
		model.addAttribute("bookingPayment", paymentDao.bookingPayment(booCode));
	}
	
}
