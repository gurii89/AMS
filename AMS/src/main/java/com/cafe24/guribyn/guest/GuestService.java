package com.cafe24.guribyn.guest;

import java.util.HashMap;
import java.util.Map;

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
	
	// 고객 목록(+페이징)
	public void guestList(Model model, int currentPage){
		int guestCount = guestDao.guestCount();
        int pagePerRow = 2;
        int lastPage = guestCount / pagePerRow;
        if((guestCount % pagePerRow) != 0) {
        	lastPage += 1;
        }        
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("lastPage", lastPage);
        session.setAttribute("top", "guest");
        
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("start", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		model.addAttribute("guestList", guestDao.guestList(map));
		model.addAttribute("page", "guestList");
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