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
import com.cafe24.guribyn.event.EventDao;
import com.cafe24.guribyn.event.EventService;
import com.cafe24.guribyn.guest.GuestDao;
import com.cafe24.guribyn.login.Login;
import com.cafe24.guribyn.payment.PaymentDao;
import com.cafe24.guribyn.room.RoomDao;
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
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	RoomDao roomDao;
	
	// 예약 등록 폼
	public void bookingAdd(Model model) {
		cateService.cateOptionSearch(model, "cate_small", "extra");
		model.addAttribute("eventList", eventDao.eventCheck(null));
		model.addAttribute("roomTypeList", roomService.roomTypeList());
		session.setAttribute("bookingExtra", null);
		session.setAttribute("bookingRoom", null);
	}
	
	// 예약 등록 처리
	public int bookingAddPro(Booking booking) {
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
		
		return bookingDao.searchBooCode();
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
		map = commonService.paging(model, currentPage, 10, bookingDao.bookingCount(map), map);
		model.addAttribute("bookingList", bookingDao.bookingList(map));
	}
	
	// 예약 개수
	public String bookingCount() {
		Gson gson = new Gson();
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", "condition");
		return gson.toJson(bookingDao.bookingCount(map));
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
	
	// 예약 취소
	public void bookingCancel(String booCode) {		
		Map<String, String> map = new HashMap<String, String>();
		map.put("booCode", booCode);
		map.put("condition", "취소");
		bookingDao.bookingCondition(map);
		bookingRoomDao.bookingRoomCondition(map);
	}
	
	// 호수 받아서 예약코드 가져오기
	public String getBooCode(String rTCode) {
		String trrr = bookingRoomDao.getBooCode(rTCode);
		System.out.println(trrr);
		return trrr;
	}
	
	// 일주일 예약 통계
	public String bookingWeek() {		
		Gson gson = new Gson();
		return gson.toJson(bookingDao.bookingWeek());
	}
	
	// 예약율 + 메인 통계 데이터
	public String bookingPercent() {
		int normal = bookingDao.bookingCount(null);
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", "boo_condition");
		map.put("input", "취소");
		int cancel = bookingDao.bookingCount(map);
		
		Booking booking = bookingDao.bookingRate();
		
		int rate = Integer.parseInt(booking.getBooIn())+Integer.parseInt(booking.getBooOut());
		int percent = 100 - (roomDao.roomEmptyCount() * 100 / roomDao.roomCount());
		
		Map<String, Integer> result = new HashMap<String, Integer>();
		result.put("normal", normal-cancel);
		result.put("cancel", cancel);		
		result.put("rate", rate);
		result.put("percent", percent);
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
}
