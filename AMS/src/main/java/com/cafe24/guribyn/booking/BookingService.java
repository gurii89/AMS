package com.cafe24.guribyn.booking;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.cate.CateService;
import com.cafe24.guribyn.event.EventService;
import com.cafe24.guribyn.extra.Extra;
import com.cafe24.guribyn.login.Login;
import com.cafe24.guribyn.room.Room;
import com.cafe24.guribyn.room.RoomService;

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
			for(Extra e : (List<Extra>)session.getAttribute("bookingExtra")) {
				e.seteId(eId);
				e.setCateCode("예약");
				bookingDao.bookingExtraAdd(e);
			}
			session.setAttribute("bookingExtra", null);
		}
		
		// 예약 객실 등록
		if(session.getAttribute("bookingRoom") != null) {
			for(Room r : (List<Room>)session.getAttribute("bookingRoom")) {
				r.seteId(eId);
				r.setCateCode("예약");
				bookingDao.bookingRoomAdd(r);
			}
			session.setAttribute("bookingRoom", null);
		}
	}
	
	// 예약 목록
	public void bookingList(Model model, int currentPage) {
		Map<String, Integer> map = commonService.listPaging(model, currentPage, 10, bookingDao.bookingCount(null));
		model.addAttribute("bookingList", bookingDao.bookingList(map));
		session.setAttribute("top", "booking");
	}
	
}
