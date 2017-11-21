package com.cafe24.guribyn.delivery;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DeliveryService {
	
	@Autowired
	DeliveryDao deliveryDao;
	
	@Autowired
	HttpSession session;
	
	
	//운송 등록 처리
	public void DeliveryAddPro(Delivery delivery) {
		deliveryDao.deliveryAddPro(delivery);
	
	}
	//운송 전체 리스트
	public void deliveryList(Model model) {
		model.addAttribute("deliveryList", deliveryDao.deliveryList());
		session.setAttribute("top", "delivery");
	}
	
	//운송 세션 설정
	public String DeliverySession() {
		session.setAttribute("top", "delivery");
		return "";
	}
}
