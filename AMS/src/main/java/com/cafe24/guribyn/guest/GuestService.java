package com.cafe24.guribyn.guest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.cate.CateService;

@Service
public class GuestService {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	GuestDao guestDao;
	
	@Autowired
	CateService cateService;
	
	// 고객 목록
	public void guestList(Model model, int currentPage){
		if(currentPage != 0) {
			int guestCount = guestDao.guestCount();
	        int pagePerRow = 10;
	        int lastPage = (int)(Math.ceil(guestCount / pagePerRow));
	        model.addAttribute("currentPage", currentPage);
	        model.addAttribute("cateCount", guestCount);
	        model.addAttribute("lastPage", lastPage);
	        session.setAttribute("top", "guest");
		}
		model.addAttribute("guestList", guestDao.guestList());
	}
	
	// 고객 등록 처리
	public void guestAddPro(Guest guest) {
		if(guest.getgCountry().equals("")) {
			guest.setgCountry(null);
		}
		if(guest.getgBirthdate().equals("")) {
			guest.setgBirthdate(null);
		}
		guestDao.guestAddPro(guest);
	}
}