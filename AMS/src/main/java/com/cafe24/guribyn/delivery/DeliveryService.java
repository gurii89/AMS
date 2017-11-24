package com.cafe24.guribyn.delivery;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.login.Login;
import com.google.gson.Gson;

@Service
public class DeliveryService {

	@Autowired
	DeliveryDao deliveryDao;
	
	@Autowired
	HttpSession session;
	
	// 운송 등록
	public void deliveryAddPro(Delivery delivery) {
		Login result = (Login)session.getAttribute("loginfor");
		delivery.seteId(result.geteId());
		deliveryDao.deliveryAdd(delivery);
	}
	
	// 운송 목록
	public void deliveryList(Model model) {
		model.addAttribute("deliveryList", deliveryDao.deliveryList());
		session.setAttribute("top", "delivery");
	}
	
	// 운송 분류에 맞는 k_code
	public String kName(String kCode) {
		Gson gson = new Gson();
		return gson.toJson(deliveryDao.kName(kCode));
	}
	
}