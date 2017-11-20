package com.cafe24.guribyn.guest;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.cate.CateService;
import com.cafe24.guribyn.login.Login;

@Service
public class GuestService {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	GuestDao guestDao;
	
	@Autowired
	CateService cateService;
	
	@Autowired
	CommonService commonService;
	
	// 고객 목록(+페이징)
	public void guestList(Model model, int currentPage){
		Map<String, Integer> map = commonService.listPaging(model, currentPage, 2, guestDao.guestCount());        
		session.setAttribute("top", "guest");
		model.addAttribute("guestList", guestDao.guestList(map));
		model.addAttribute("page", "guestList");
	}
	
	// 고객 등록 처리
	public void guestAddPro(Guest guest) {
		if(guest.getgNation().equals("")) {
			guest.setgNation(null);
		}
		if(guest.getgBirthdate().equals("")) {
			guest.setgBirthdate(null);
		}
		Login result = (Login)session.getAttribute("loginfor");
		guest.seteId(result.geteId());
		guestDao.guestAddPro(guest);
	}
	
	// 고객 수정 폼
	public void guestOne(Model model, int gCode) {
		cateService.cateOptionSearch(model, "cate_small", "nation");
		model.addAttribute("guest", guestDao.guestOne(gCode));
	}
	
	// 고객 수정 처리
	public void guestMod(Guest guest) {
		if(guest.getgBirthdate().equals("")) {
			guest.setgBirthdate(null);
		}
		guestDao.guestMod(guest);
	}
}